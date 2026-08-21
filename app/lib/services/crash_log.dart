import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'backup_exclusion.dart';

/// Records crashes to a local file that only the user can send anywhere.
///
/// The alternative — Sentry, Crashlytics — was considered and rejected.
/// An ad SDK announces itself: the user sees the ad. A crash reporter is
/// invisible, so shipping one in a period tracker means a health app
/// quietly transmitting to a third party with no way for the user to
/// notice. It would also put an asterisk on the one promise this product
/// is built around, and a promise with an asterisk can't be verified.
///
/// So: capture locally, show the user the exact text, and let them decide
/// whether to send it. Fewer reports arrive than automatic reporting
/// would produce. That is the cost, and it is worth paying.
class CrashLog {
  CrashLog._();

  static final instance = CrashLog._();

  /// Kept out of iCloud alongside the diary itself.
  ///
  /// Documents is backed up by default on iOS just like Application
  /// Support. The entries here are deliberately narrow — exception type,
  /// message, stack, never a widget dump (see [record]) — but "narrow"
  /// is not "none": an exception message can quote the input that broke,
  /// and in this app that input is somebody's health data. Excluding the
  /// file costs one call and removes the question entirely.
  @visibleForTesting
  BackupExclusion backupExclusion = const BackupExclusion();

  /// Keeps the file small and bounded — this is a debugging aid, not an
  /// archive, and an unbounded log on a phone is its own bug.
  static const maxEntries = 20;
  static const _fileName = 'vera_diagnostics.log';
  static const _separator = '\n===== ENTRY =====\n';

  // Deliberately not cached: the documents path can change between runs
  // (iOS reassigns it after a restore), and a stale handle would write to
  // a directory that no longer exists — silently, since every failure
  // here is swallowed. Resolving each time costs nothing on this path.
  Future<File> _resolveFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  /// Installs global error handlers. Call once at startup.
  void install() {
    final previousOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      previousOnError?.call(details);
      unawaited(record(details.exception, details.stack));
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      unawaited(record(error, stack));
      // false: let the platform continue its default handling too.
      return false;
    };
  }

  /// Appends one entry, trimming the file back to [maxEntries].
  ///
  /// Only the exception and stack are written. Widget-tree dumps and
  /// arbitrary context are deliberately excluded — a stack trace is
  /// structural, but a widget dump can carry rendered strings, and in
  /// this app rendered strings are somebody's health data.
  Future<void> record(Object error, StackTrace? stack) async {
    try {
      final file = await _resolveFile();
      final entry = StringBuffer()
        ..writeln(DateTime.now().toIso8601String())
        ..writeln(error.runtimeType.toString())
        ..writeln(_truncate(error.toString()))
        ..writeln(_truncate(stack?.toString() ?? '', limit: 4000));

      final existing = await file.exists() ? await file.readAsString() : '';
      final entries = existing.isEmpty
          ? <String>[]
          : existing
                .split(_separator)
                .where((e) => e.trim().isNotEmpty)
                .toList();
      entries.add(entry.toString());
      final kept = entries.length > maxEntries
          ? entries.sublist(entries.length - maxEntries)
          : entries;

      await file.writeAsString(kept.join(_separator), flush: true);
      // After the write, not before: the attribute needs the file to exist.
      // Unlike the diary this path rewrites in place rather than renaming,
      // but re-applying is free and survives a future switch to rename.
      await backupExclusion.exclude(file.path);
    } on Object {
      // Diagnostics failing must never itself become a failure path.
    }
  }

  /// The full log text, or null when nothing has been recorded.
  Future<String?> read() async {
    try {
      final file = await _resolveFile();
      if (!await file.exists()) return null;
      final text = await file.readAsString();
      return text.trim().isEmpty ? null : text;
    } on Object {
      return null;
    }
  }

  Future<void> clear() async {
    try {
      final file = await _resolveFile();
      if (await file.exists()) await file.delete();
    } on Object {
      // Nothing to do.
    }
  }

  String _truncate(String value, {int limit = 1000}) =>
      value.length <= limit ? value : '${value.substring(0, limit)}…';
}

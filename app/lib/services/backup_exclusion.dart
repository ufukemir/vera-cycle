import 'dart:io';

import 'package:flutter/services.dart';

/// Keeps the encrypted diary out of iCloud.
///
/// Android is handled declaratively (`allowBackup="false"` plus
/// `data_extraction_rules.xml`). iOS has no manifest equivalent: everything
/// under Application Support is backed up unless the file is individually
/// marked with `NSURLIsExcludedFromBackupKey`, so this has to be applied in
/// code, per file, after the file exists.
///
/// Without it the ciphertext would ride along in an iCloud backup while the
/// key — pinned to the device by [SecureKeyStore.iosOptions] — would not,
/// which is both a broken privacy claim and a restore that silently yields
/// unreadable data.
class BackupExclusion {
  const BackupExclusion();

  static const _channel = MethodChannel('vera/backup_exclusion');

  /// Marks [path] as excluded from device backups. A no-op off iOS, and
  /// deliberately forgiving: failing to set an attribute must never stop the
  /// user from saving their day.
  Future<void> exclude(String path) async {
    if (!Platform.isIOS) return;
    try {
      await _channel.invokeMethod<void>('exclude', {'path': path});
    } on MissingPluginException {
      // Older build without the native side registered.
    } on PlatformException {
      // The file may not exist yet, or the attribute may be unsupported.
    }
  }
}

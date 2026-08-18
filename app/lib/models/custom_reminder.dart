/// A reminder the user wrote themselves (Premium).
///
/// [id] is assigned once and never reused, because it doubles as the OS
/// notification id: reusing a freed id would let a deleted reminder's
/// pending notification resurface under a new reminder's name.
class CustomReminder {
  const CustomReminder({
    required this.id,
    required this.label,
    required this.minuteOfDay,
    this.enabled = true,
  });

  /// Offset applied to [id] to get a notification id, keeping custom
  /// reminders clear of the fixed [ReminderCategory] ids.
  static const notificationIdBase = 1000;

  final int id;
  final String label;
  final int minuteOfDay;
  final bool enabled;

  int get notificationId => notificationIdBase + id;
  int get hour => minuteOfDay ~/ 60;
  int get minute => minuteOfDay % 60;

  CustomReminder copyWith({String? label, int? minuteOfDay, bool? enabled}) =>
      CustomReminder(
        id: id,
        label: label ?? this.label,
        minuteOfDay: minuteOfDay ?? this.minuteOfDay,
        enabled: enabled ?? this.enabled,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'minuteOfDay': minuteOfDay,
        'enabled': enabled,
      };

  /// Returns `null` for anything malformed rather than throwing — one bad
  /// entry must not make the whole reminder list unreadable.
  static CustomReminder? fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final label = json['label'];
    final minuteOfDay = json['minuteOfDay'];
    if (id is! int || label is! String || minuteOfDay is! int) return null;
    if (label.trim().isEmpty) return null;
    if (minuteOfDay < 0 || minuteOfDay > 24 * 60 - 1) return null;
    return CustomReminder(
      id: id,
      label: label,
      minuteOfDay: minuteOfDay,
      enabled: json['enabled'] as bool? ?? true,
    );
  }
}

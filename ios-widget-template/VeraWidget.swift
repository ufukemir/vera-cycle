// Vera home-screen widget (iOS).
//
// Paste this over the VeraWidget.swift that Xcode generates when you add
// File → New → Target → Widget Extension named "VeraWidget".
//
// Contract with the Dart side (lib/services/home_widget_service.dart):
//   App Group : group.com.ufukemir.vera
//   Keys      : vera_eyebrow, vera_headline, vera_secondary
// Those three names must match exactly, or the widget renders its
// placeholder forever without any error.
//
// Only three short strings ever cross this boundary — a phase label, a
// headline, and an optional countdown line. No symptoms, no notes, no
// dates. The rule, from the Dart doc comment: widget content can appear
// on a lock screen, so nothing here should embarrass someone if a
// stranger glances at their phone.

import SwiftUI
import WidgetKit

private enum VeraWidgetData {
    static let appGroupId = "group.com.ufukemir.vera"
    static let eyebrowKey = "vera_eyebrow"
    static let headlineKey = "vera_headline"
    static let secondaryKey = "vera_secondary"

    /// `home_widget` writes through UserDefaults in the shared container.
    static func read() -> VeraEntry {
        let defaults = UserDefaults(suiteName: appGroupId)
        return VeraEntry(
            date: Date(),
            eyebrow: defaults?.string(forKey: eyebrowKey) ?? "Vera",
            headline: defaults?.string(forKey: headlineKey) ?? "",
            secondary: defaults?.string(forKey: secondaryKey) ?? ""
        )
    }
}

struct VeraEntry: TimelineEntry {
    let date: Date
    let eyebrow: String
    let headline: String
    let secondary: String
}

struct VeraProvider: TimelineProvider {
    /// Shown in the widget gallery, before the app has ever written data.
    /// Deliberately generic — the gallery preview is visible to anyone
    /// browsing widgets on the device.
    func placeholder(in context: Context) -> VeraEntry {
        VeraEntry(date: Date(), eyebrow: "Vera", headline: "—", secondary: "")
    }

    func getSnapshot(in context: Context,
                     completion: @escaping (VeraEntry) -> Void) {
        completion(context.isPreview ? placeholder(in: context)
                                     : VeraWidgetData.read())
    }

    func getTimeline(in context: Context,
                     completion: @escaping (Timeline<VeraEntry>) -> Void) {
        // One entry, refreshed on the hour. The app pushes an update
        // whenever Home rebuilds, so this is only a safety net for the
        // case where the app has not been opened in a while — and an
        // hourly cadence is plenty for a day-granularity countdown.
        let entry = VeraWidgetData.read()
        let next = Calendar.current.date(byAdding: .hour, value: 1,
                                         to: Date()) ?? Date().addingTimeInterval(3600)
        completion(Timeline(entries: [entry], policy: .after(next)))
    }
}

struct VeraWidgetEntryView: View {
    var entry: VeraProvider.Entry

    // Matches AppPalette in lib/theme/app_theme.dart. Duplicated as raw
    // values because the widget target cannot import Dart constants.
    private static let cream = Color(red: 1.0, green: 0.973, blue: 0.961)
    private static let roseDeep = Color(red: 0.478, green: 0.149, blue: 0.278)
    private static let rose = Color(red: 0.710, green: 0.251, blue: 0.420)

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(entry.eyebrow)
                .font(.caption2)
                .foregroundStyle(Self.rose)
                .lineLimit(1)

            Text(entry.headline)
                .font(.headline)
                .foregroundStyle(Self.roseDeep)
                // Two lines, not one: the headline is a full sentence in
                // German and Finnish and would otherwise be truncated
                // mid-word.
                .lineLimit(2)
                .minimumScaleFactor(0.8)

            if !entry.secondary.isEmpty {
                Text(entry.secondary)
                    .font(.caption)
                    .foregroundStyle(Self.rose)
                    .lineLimit(1)
            }

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(12)
        // iOS 17 moved widget backgrounds behind this modifier; the
        // availability check keeps the widget building on older SDKs.
        .modifier(VeraWidgetBackground(color: Self.cream))
    }
}

/// `containerBackground` is iOS 17+; on earlier versions the background
/// goes straight on the view. Without this the widget renders with the
/// system default background on iOS 17 and is rejected in review for
/// not adopting the required modifier.
private struct VeraWidgetBackground: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content.containerBackground(color, for: .widget)
        } else {
            content.background(color)
        }
    }
}

@main
struct VeraWidget: Widget {
    // Must match HomeWidgetService.iOSWidgetName on the Dart side.
    let kind = "VeraWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VeraProvider()) { entry in
            VeraWidgetEntryView(entry: entry)
        }
        // These two strings are shown in the widget gallery. They are NOT
        // localized here: a widget extension needs its own InfoPlist
        // strings files to localize, and the app deliberately ships no
        // untranslated user-facing text — so keep them neutral until the
        // extension gets its own .lproj set.
        .configurationDisplayName("Vera")
        .description("Your cycle day at a glance.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

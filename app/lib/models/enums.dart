/// Menstrual flow intensity for a single day.
///
/// [FlowIntensity.spotting] deliberately does NOT count as a period start on its
/// own — spotting before a period is common, and treating it as day 1 skews every
/// downstream prediction. See [CycleAnalyzer].
enum FlowIntensity { spotting, light, medium, heavy }

/// Physical symptoms a user can log. Neutral, non-judgemental wording only.
enum Symptom {
  cramps,
  headache,
  bloating,
  breastTenderness,
  acne,
  fatigue,
  nausea,
  backPain,
  appetiteChange,
  sleepTrouble,
}

/// Mood labels. Chosen to be descriptive rather than evaluative — no "good"/"bad"
/// days, because the app must not imply the user's cycle makes them a worse person.
enum Mood { calm, anxious, irritable, low, energetic }

/// Cervical mucus observation (fertility-awareness users). Optional tracker,
/// disabled by default.
enum CervicalMucus { dry, sticky, creamy, watery, eggWhite }

/// Phase of the cycle shown on the home screen.
///
/// [CyclePhase.fertileWindow] is an *estimate* and is never presented as
/// contraceptive guidance — that claim would make this a regulated medical
/// device (see CLAUDE.md, principle 7).
enum CyclePhase { menstrual, follicular, fertileWindow, luteal, unknown }

/// How much the app trusts its own prediction. Surfaced directly in the UI:
/// hiding low confidence behind a confident-looking date is the exact dishonesty
/// this product exists to avoid.
enum PredictionConfidence { none, low, medium, high }

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
  pelvicPain,
  dizziness,
}

/// Mood labels. Chosen to be descriptive rather than evaluative — no "good"/"bad"
/// days, because the app must not imply the user's cycle makes them a worse person.
enum Mood {
  calm,
  anxious,
  irritable,
  low,
  energetic,
  happy,
  content,
  sad,
  depressed,
  emotional,
}

/// Cervical mucus observation (fertility-awareness users). Optional tracker,
/// disabled by default.
enum CervicalMucus { dry, sticky, creamy, watery, eggWhite }

/// Energy level — deliberately separate from [Mood]: a low-energy day and an
/// anxious day are different things, and conflating them loses information a
/// user might specifically want to correlate with cycle phase.
enum EnergyLevel { low, medium, high, energetic }

/// Skin and hair observations. Descriptive, not a dermatology diagnosis.
enum SkinHairSymptom {
  healthyGlow,
  skinRedness,
  skinDryness,
  skinOiliness,
  goodHairDay,
  badHairDay,
  hairLoss,
  oilyScalp,
}

/// Self breast-exam findings. This is a logging aid, not a screening tool —
/// see CLAUDE.md principle 7; the app never interprets these, it only
/// records what the user noticed so they have a timeline to bring to a
/// clinician.
enum BreastExamFinding {
  allNormal,
  lump,
  indentation,
  redness,
  crackedNipple,
  discharge,
}

/// Cervix position (fertility-awareness method). Advanced/opt-in tracker.
enum CervixPosition { low, medium, high }

/// Cervix os opening (fertility-awareness method). Advanced/opt-in tracker.
enum CervixOpening { closed, medium, open }

/// Cervix firmness (fertility-awareness method). Advanced/opt-in tracker.
enum CervixFirmness { soft, medium, firm }

/// Scenic background for the home screen hero — the reference app's
/// photo-themed home. Assets are openly licensed (assets/photos/NOTICE.md).
enum HomeTheme {
  wheat,
  sky,
  field,
  blossom,
  plain,

  // Premium. Gated on look alone: picking one of these never changes what
  // the app records or predicts, so a lapsed subscription falls back to a
  // free background and loses nothing else.
  dusk(premium: true),
  meadow(premium: true),
  petal(premium: true),
  bloom(premium: true);

  const HomeTheme({this.premium = false});

  final bool premium;
}

/// Home-screen companion mascot — hand-drawn vector characters (see
/// `illustrations.dart`), a playful reference-app pattern rebuilt with
/// original art. `none` hides it entirely; purely decorative.
enum Mascot {
  droplet,
  flower,
  moon,
  none,

  // Premium, same reasoning as the premium [HomeTheme] values.
  star(premium: true),
  leaf(premium: true);

  const Mascot({this.premium = false});

  final bool premium;
}

/// Optional ovulation (LH) test result for a day. Opt-in tracker, default
/// off. The app records the result, it never interprets it — see CLAUDE.md
/// principle 7.
enum OvulationTestResult { negative, positive }

/// Why the user opened the app, collected once during onboarding. Informs
/// light personalization only (e.g. which optional trackers default on) —
/// never gates a core feature behind it.
enum Goal { trackPeriod, tryingToConceive, pregnancyTracking }

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

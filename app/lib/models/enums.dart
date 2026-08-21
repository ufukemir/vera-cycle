/// Menstrual flow intensity for a single day.
///
/// [FlowIntensity.spotting] deliberately does NOT count as a period start on its
/// own — spotting before a period is common, and treating it as day 1 skews every
/// downstream prediction. See [CycleAnalyzer].
enum FlowIntensity { spotting, light, medium, heavy }

/// Physical symptoms a user can log. Neutral, non-judgemental wording only.
///
/// Grown from the original 12 to cover the ground a comparable app's
/// symptom list does — [SymptomGroup] is what makes 30 of them scannable
/// instead of a single long wall of chips. Left out on purpose: cervical
/// mucus texture, which is already [CervicalMucus], its own tracker with
/// its own screen; and a handful of the reference app's "symptoms" that
/// read as personality traits or moods rather than physical sensations —
/// those belong under [Mood], or nowhere, not duplicated here.
enum Symptom {
  // Baş — head
  headache,
  migraine,
  dizziness,
  acne,
  highFever,
  // Gövde — body
  neckPain,
  shoulderPain,
  breastTenderness,
  backPain,
  limbPain,
  muscleAche,
  chills,
  nightSweats,
  hotFlashes,
  weightGain,
  // Karın — abdomen
  cramps,
  bloating,
  constipation,
  diarrhea,
  nausea,
  indigestion,
  gasPain,
  pelvicPain,
  // Genel — general
  fatigue,
  appetiteChange,
  sleepTrouble,
  feelingUnwell,
  itching,
  // Zihinsel — cognitive (not emotional; those are Mood's job)
  troubleFocusing,
  forgetfulness,
}

/// The section a [Symptom] is shown under, in the order the picker groups
/// them — an anatomical/functional grouping, not alphabetical, because
/// "what part of you does this concern" is how a person actually scans a
/// list of thirty options looking for one.
enum SymptomGroup { head, body, abdomen, general, cognitive }

SymptomGroup symptomGroup(Symptom value) => switch (value) {
  Symptom.headache ||
  Symptom.migraine ||
  Symptom.dizziness ||
  Symptom.acne ||
  Symptom.highFever => SymptomGroup.head,
  Symptom.neckPain ||
  Symptom.shoulderPain ||
  Symptom.breastTenderness ||
  Symptom.backPain ||
  Symptom.limbPain ||
  Symptom.muscleAche ||
  Symptom.chills ||
  Symptom.nightSweats ||
  Symptom.hotFlashes ||
  Symptom.weightGain => SymptomGroup.body,
  Symptom.cramps ||
  Symptom.bloating ||
  Symptom.constipation ||
  Symptom.diarrhea ||
  Symptom.nausea ||
  Symptom.indigestion ||
  Symptom.gasPain ||
  Symptom.pelvicPain => SymptomGroup.abdomen,
  Symptom.fatigue ||
  Symptom.appetiteChange ||
  Symptom.sleepTrouble ||
  Symptom.feelingUnwell ||
  Symptom.itching => SymptomGroup.general,
  Symptom.troubleFocusing || Symptom.forgetfulness => SymptomGroup.cognitive,
};

/// Mood labels. Chosen to be descriptive rather than evaluative — no "good"/"bad"
/// days, because the app must not imply the user's cycle makes them a worse person.
///
/// Grown from 10 to 26. The reference app's own mood picker runs past 50,
/// but roughly half of those are judgemental or joke self-labels —
/// "stupid," "dangerous," "tormenting," "devil" — which is exactly what
/// this enum's own founding rule above rules out. Added only the ones that
/// name a feeling, not a verdict on the person having it.
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
  excited,
  hopeful,
  proud,
  disappointed,
  confident,
  surprised,
  indifferent,
  peaceful,
  inLove,
  shy,
  playful,
  exhausted,
  lonely,
  overwhelmed,
  grateful,
  nostalgic,
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

/// What happened, for people who track their sex life.
///
/// Multi-select, and behind the same opt-in switch the old yes/no flag was:
/// CLAUDE.md keeps sexual questions off by default and only shows them if
/// the user asks for them. The list is descriptive and non-evaluative for
/// the same reason the mood list is — [none] and [noOrgasm] are ordinary
/// entries, not failures to report.
enum SexLifeEntry {
  none,
  unprotected,
  protectedSex,
  masturbation,
  noOrgasm,
  orgasm,
  highDesire,
}

/// What was used, or missed, today.
///
/// Separate from the free-text medication list because contraception is the
/// one medication most people track daily and by the same handful of names
/// every time, and typing "pill" 365 times a year is not tracking. The
/// three pill entries are mutually exclusive — the pill was taken, taken
/// late, or missed — while the methods are not, because switching methods
/// mid-cycle is ordinary.
///
/// Deliberately no evaluative wording: [pillMissed] is a fact worth
/// recording, not a failure to confess.
enum BirthControlEntry {
  pillTaken,
  pillLate,
  pillMissed,
  patch,
  ring,
  injection,
  implant,
  iud,
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
  bloom(premium: true),
  ocean(premium: true),
  autumn(premium: true),
  night(premium: true);

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
  leaf(premium: true),
  cat(premium: true),
  rabbit(premium: true),
  bird(premium: true);

  const Mascot({this.premium = false});

  final bool premium;
}

/// Optional ovulation (LH) test result for a day. Opt-in tracker, default
/// off. The app records the result, it never interprets it — see CLAUDE.md
/// principle 7.
/// LH test reading, in the three levels the strips actually distinguish.
///
/// The stored names stay `negative` and `positive` so logs written before
/// the middle level existed still decode: an LH strip with no second line
/// is the low reading, and a second line as dark as the control is the
/// peak. `high` is new. Renaming the constants would have made every
/// existing entry unreadable for a cosmetic tidy.
enum OvulationTestResult { negative, high, positive }

/// Home pregnancy test reading. `faint` is its own answer rather than a
/// hedge between the other two: a faint line is what an early positive
/// looks like, and forcing it into yes/no would throw away the thing the
/// user most wants to write down.
enum PregnancyTestResult { positive, faint, negative }

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

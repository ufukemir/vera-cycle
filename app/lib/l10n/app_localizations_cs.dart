// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Přeskočit';

  @override
  String get actionContinue => 'Pokračovat';

  @override
  String get actionDone => 'Hotovo';

  @override
  String get actionCancel => 'Zrušit';

  @override
  String get actionClear => 'Vymazat';

  @override
  String get actionDelete => 'Smazat';

  @override
  String get actionEnable => 'Zapnout';

  @override
  String get commonIDontKnow => 'Nevím';

  @override
  String get commonYes => 'Ano';

  @override
  String get commonNo => 'Ne';

  @override
  String get commonNotSure => 'Nevím jistě';

  @override
  String get pinSetupTitle => 'Nastavte PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Zvolte šestimístný PIN, kterým se aplikace uzamkne';

  @override
  String get pinSetupConfirmPrompt => 'Zadejte ho ještě jednou pro potvrzení';

  @override
  String get pinSetupMismatch => 'Kódy se neshodují — zkusme to znovu';

  @override
  String get pinSetupBiometricTitle => 'Rychlejší odemknutí?';

  @override
  String get pinSetupBiometricBody =>
      'K odemknutí můžete použít i otisk prstu nebo obličej — PIN přitom zůstává jako záložní možnost.';

  @override
  String get lockScreenTitle => 'Uzamčeno';

  @override
  String get lockScreenEnterPin => 'Zadejte PIN';

  @override
  String get lockScreenWrongPin => 'Tento PIN nesouhlasí';

  @override
  String get lockScreenUseBiometrics => 'Použít biometriku';

  @override
  String get lockScreenUseFaceId => 'Použít Face ID';

  @override
  String get lockScreenUseFingerprint => 'Použít otisk prstu';

  @override
  String get lockScreenForgotPin => 'Zapomenutý PIN?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Jak ho chceš obnovit?';

  @override
  String get lockScreenResetViaDevice => 'Ověřit pomocí tohoto zařízení';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Tvá data zůstanou zachována. Stačí se ověřit vlastním zámkem telefonu — Face ID, otiskem prstu nebo kódem.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Ověř se pro nastavení nového PINu';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Příliš mnoho pokusů. Zkuste to znovu za $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Smazat všechna data?';

  @override
  String get lockScreenEraseBody =>
      'Trvale se smaže vše, co je v tomto zařízení. Neexistuje žádný účet ani záloha na serveru, takže to nejde vzít zpět.';

  @override
  String get lockScreenEraseConfirm => 'Smazat vše';

  @override
  String get onboardingPrivacyTitle => 'Vítejte';

  @override
  String get onboardingPrivacyBody =>
      'Data o vašem cyklu zůstávají zašifrovaná jen v tomto zařízení. Neexistuje žádný účet ani synchronizace s cloudem — nic ze zaznamenaných údajů se nikam neodesílá. Šifrovací klíč je uložený v zabezpečeném hardwaru telefonu a všechno můžete kdykoli exportovat nebo smazat.';

  @override
  String get onboardingLastPeriodTitle => 'Kdy začala poslední menstruace?';

  @override
  String get onboardingLastPeriodBody =>
      'Pomůže nám to na začátek — v kalendáři to jde kdykoli později opravit.';

  @override
  String get onboardingPickDate => 'Vyberte datum';

  @override
  String get onboardingCycleLengthTitle => 'Jak dlouhý bývá váš cyklus?';

  @override
  String get onboardingCycleLengthBody =>
      'Stačí přibližné číslo. Skutečný odhad začneme nabízet, až budeme mít pár celých cyklů.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Kolik dní obvykle trvá vaše menstruace?';

  @override
  String get onboardingPeriodLengthBody =>
      'Podle toho doplníme poslední menstruaci, ať nezačínáte od nuly.';

  @override
  String get onboardingDaysUnit => 'dní';

  @override
  String get onboardingGoalTitle => 'Co vás sem přivádí?';

  @override
  String get onboardingGoalBody =>
      'Pomůže nám to ukázat vám nejdřív to podstatné — v Nastavení to jde kdykoli změnit.';

  @override
  String get goalTrackPeriod => 'Sledovat menstruaci';

  @override
  String get goalTryingToConceive => 'Snaha o otěhotnění';

  @override
  String get goalPregnancyTracking => 'Sledování těhotenství';

  @override
  String get onboardingRegularityTitle => 'Bývá vaše menstruace pravidelná?';

  @override
  String get onboardingRegularityBody =>
      'Neexistuje tu špatná odpověď — jen nám to pomůže vaše tělo trochu poznat.';

  @override
  String get onboardingCrampsTitle => 'Míváte křeče?';

  @override
  String get onboardingCrampsBody =>
      'Postaráme se o to, aby se v takové dny dalo snadno zaznamenat, jak se cítíte.';

  @override
  String get onboardingBirthYearTitle => 'Kdy ses narodila?';

  @override
  String get onboardingBirthYearBody =>
      'Jen pro úplnější obrázek — nikdy se to nepoužije k žádné předpovědi.';

  @override
  String get onboardingPmsTitle => 'Objevuje se obvykle předem něco?';

  @override
  String get onboardingPmsBody =>
      'Vyber, kolik chceš. Nikde se to neukládá, neexistuje špatná odpověď.';

  @override
  String get onboardingNotificationTitle => 'Chcete jemné připomínky?';

  @override
  String get onboardingNotificationBody =>
      'Můžeme se ozvat, než se očekává vaše menstruace.';

  @override
  String get onboardingNotificationMockTitle => 'Menstruace možná brzy začne';

  @override
  String get onboardingNotificationMockBody => 'Podle zaznamenaných cyklů';

  @override
  String get onboardingNotificationAllow => 'Zapnout připomínky';

  @override
  String get onboardingNotificationNotNow => 'Teď ne';

  @override
  String get onboardingBuildingPlanTitle => 'Připravujeme aplikaci';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Zabezpečujeme vaše data v tomto zařízení';

  @override
  String get onboardingBuildingPlanStep2 => 'Ukládáme vaše předvolby';

  @override
  String get onboardingBuildingPlanStep3 => 'Připravujeme kalendář';

  @override
  String get onboardingBuildingPlanDone => 'Vše je připravené';

  @override
  String get navHome => 'Domů';

  @override
  String get navCalendar => 'Kalendář';

  @override
  String get navInsights => 'Přehledy';

  @override
  String get navSettings => 'Nastavení';

  @override
  String get navReminders => 'Připomenutí';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Zaznamenat';

  @override
  String homeCycleDayLabel(int day) {
    return '$day. den';
  }

  @override
  String get homeNoCycleYet => 'Zatím není zaznamenaná žádná menstruace';

  @override
  String get homePhaseMenstrual => 'Menstruace';

  @override
  String get homePhaseFollicular => 'Folikulární fáze';

  @override
  String get homePhaseFertileWindow => 'Odhadované plodné okno';

  @override
  String get homePhaseLuteal => 'Luteální fáze';

  @override
  String get homePhaseUnknown => 'Málo aktuálních dat';

  @override
  String get homePredictionInsufficientTitle => 'Zatím málo dat';

  @override
  String get homePredictionInsufficientBody =>
      'Zaznamenejte další menstruaci a začneme odhadovat.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Vysoká spolehlivost';

  @override
  String get homeConfidenceMedium => 'Střední spolehlivost';

  @override
  String get homeConfidenceLow => 'Nízká spolehlivost';

  @override
  String get homeIrregularNote =>
      'Délka vašeho cyklu v poslední době kolísá víc než obvykle. Pokud je to pro vás nové, může to stát za zmínku při příští prohlídce.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Vychází z obvyklého načasování cyklu — není to metoda antikoncepce.';

  @override
  String get homePeriodStartedButton => 'Menstruace začala dnes';

  @override
  String get homePeriodStartedSnackbar =>
      'Zaznamenáno — menstruace začala dnes';

  @override
  String get actionUndo => 'Zpět';

  @override
  String get comingSoon => 'Již brzy';

  @override
  String get dayLogFlowLabel => 'Intenzita krvácení';

  @override
  String get flowSpotting => 'Špinění';

  @override
  String get flowLight => 'Slabé';

  @override
  String get flowMedium => 'Střední';

  @override
  String get flowHeavy => 'Silné';

  @override
  String get flowNone => 'Žádné';

  @override
  String get dayLogSymptomsLabel => 'Příznaky';

  @override
  String get symptomCramps => 'Křeče';

  @override
  String get symptomHeadache => 'Bolest hlavy';

  @override
  String get symptomBloating => 'Nadýmání';

  @override
  String get symptomBreastTenderness => 'Citlivost prsou';

  @override
  String get symptomAcne => 'Akné';

  @override
  String get symptomFatigue => 'Únava';

  @override
  String get symptomNausea => 'Nevolnost';

  @override
  String get symptomBackPain => 'Bolest zad';

  @override
  String get symptomAppetiteChange => 'Změna chuti k jídlu';

  @override
  String get symptomSleepTrouble => 'Potíže se spánkem';

  @override
  String get symptomPelvicPain => 'Bolest v podbřišku';

  @override
  String get symptomDizziness => 'Závratě';

  @override
  String get symptomMigraine => 'Migréna';

  @override
  String get symptomHighFever => 'Vysoká horečka';

  @override
  String get symptomNeckPain => 'Bolest krku';

  @override
  String get symptomShoulderPain => 'Bolest ramene';

  @override
  String get symptomLimbPain => 'Bolest končetin';

  @override
  String get symptomMuscleAche => 'Svalová bolest';

  @override
  String get symptomChills => 'Zimnice';

  @override
  String get symptomNightSweats => 'Noční pocení';

  @override
  String get symptomHotFlashes => 'Návaly horka';

  @override
  String get symptomWeightGain => 'Přibývání na váze';

  @override
  String get symptomConstipation => 'Zácpa';

  @override
  String get symptomDiarrhea => 'Průjem';

  @override
  String get symptomIndigestion => 'Špatné trávení';

  @override
  String get symptomGasPain => 'Bolest z nadýmání';

  @override
  String get symptomFeelingUnwell => 'Pocit nevolnosti';

  @override
  String get symptomItching => 'Svědění';

  @override
  String get symptomTroubleFocusing => 'Potíže se soustředěním';

  @override
  String get symptomForgetfulness => 'Zapomnětlivost';

  @override
  String get symptomGroupHead => 'Hlava';

  @override
  String get symptomGroupBody => 'Tělo';

  @override
  String get symptomGroupAbdomen => 'Břicho';

  @override
  String get symptomGroupGeneral => 'Obecné';

  @override
  String get symptomGroupCognitive => 'Kognitivní';

  @override
  String get dayLogMoodLabel => 'Nálada';

  @override
  String get moodCalm => 'Klid';

  @override
  String get moodAnxious => 'Úzkost';

  @override
  String get moodIrritable => 'Podrážděnost';

  @override
  String get moodLow => 'Skleslost';

  @override
  String get moodEnergetic => 'Energie';

  @override
  String get moodHappy => 'Radost';

  @override
  String get moodContent => 'Spokojenost';

  @override
  String get moodSad => 'Smutek';

  @override
  String get moodDepressed => 'Sklíčenost';

  @override
  String get moodEmotional => 'Rozcitlivělost';

  @override
  String get moodExcited => 'Nadšená';

  @override
  String get moodHopeful => 'Plná naděje';

  @override
  String get moodProud => 'Hrdá';

  @override
  String get moodDisappointed => 'Zklamaná';

  @override
  String get moodConfident => 'Sebevědomá';

  @override
  String get moodSurprised => 'Překvapená';

  @override
  String get moodIndifferent => 'Lhostejná';

  @override
  String get moodPeaceful => 'Klidná';

  @override
  String get moodInLove => 'Zamilovaná';

  @override
  String get moodShy => 'Stydlivá';

  @override
  String get moodPlayful => 'Hravá';

  @override
  String get moodExhausted => 'Vyčerpaná';

  @override
  String get moodLonely => 'Osamělá';

  @override
  String get moodOverwhelmed => 'Zahlcená';

  @override
  String get moodGrateful => 'Vděčná';

  @override
  String get moodNostalgic => 'Nostalgická';

  @override
  String get dayLogNoteLabel => 'Poznámka';

  @override
  String get dayLogNoteHint => 'Cokoli, co si chcete o dnešku zapamatovat';

  @override
  String get dayLogOptionalTrackersLabel => 'Volitelné záznamy';

  @override
  String get dayLogSexualActivityLabel => 'Sexuální aktivita';

  @override
  String get sexLifeNone => 'Nic';

  @override
  String get sexLifeUnprotected => 'Nechráněný sex';

  @override
  String get sexLifeProtected => 'Chráněný sex';

  @override
  String get sexLifeMasturbation => 'Masturbace';

  @override
  String get sexLifeNoOrgasm => 'Bez orgasmu';

  @override
  String get sexLifeOrgasm => 'Orgasmus';

  @override
  String get sexLifeHighDesire => 'Vysoká touha';

  @override
  String get dayLogBbtLabel => 'Bazální tělesná teplota';

  @override
  String get dayLogMucusLabel => 'Cervikální hlen';

  @override
  String get mucusDry => 'Sucho';

  @override
  String get mucusSticky => 'Lepkavý';

  @override
  String get mucusCreamy => 'Krémový';

  @override
  String get mucusWatery => 'Vodnatý';

  @override
  String get mucusEggWhite => 'Vaječný bílek';

  @override
  String get dayLogSavedIndicator => 'Uloženo';

  @override
  String get homeOpenTodayLog => 'Doplnit údaje k dnešku';

  @override
  String get calendarLegendActual => 'Zaznamenaná menstruace';

  @override
  String get calendarLegendPredicted => 'Předpokládané okno';

  @override
  String get calendarLegendFertile => 'Odhadované plodné okno';

  @override
  String get calendarLegendOvulation => 'Odhadovaná ovulace';

  @override
  String get dayDetailFertileTitle => 'V odhadovaném plodném okně';

  @override
  String get dayDetailOvulationTitle => 'Odhadovaný den ovulace';

  @override
  String get dayDetailOvulationBody =>
      'Podle obvyklého načasování bývá otěhotnění kolem tohoto dne pravděpodobnější — jde o odhad, ne o jistotu.';

  @override
  String get insightsCyclesLoggedLabel => 'Zaznamenané cykly';

  @override
  String get insightsAveragePeriodLengthLabel => 'Průměrná délka menstruace';

  @override
  String get insightsAverageCycleLengthLabel => 'Průměrná délka cyklu';

  @override
  String insightsVariabilityLabel(num days) {
    final intl.NumberFormat daysNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kolísá zhruba o $daysString dní',
      many: 'Kolísá zhruba o $daysString dne',
      few: 'Kolísá zhruba o $daysString dny',
      one: 'Kolísá zhruba o $daysString den',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Zatím málo dat';

  @override
  String get insightsNotEnoughDataBody =>
      'Zaznamenejte pár celých cyklů a objeví se tu vaše průměry.';

  @override
  String get insightsSymptomFrequencyTitle => 'Příznaky podle dne cyklu';

  @override
  String get insightsNoSymptomsLogged =>
      'Zatím nejsou zaznamenané žádné příznaky';

  @override
  String get settingsLanguageLabel => 'Jazyk';

  @override
  String get settingsLanguageSystem => 'Jazyk systému';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageTurkish => 'Türkçe';

  @override
  String get settingsLanguageArabic => 'العربية';

  @override
  String get settingsLanguageSpanish => 'Español';

  @override
  String get settingsLanguageFrench => 'Français';

  @override
  String get settingsLanguageGerman => 'Deutsch';

  @override
  String get settingsLanguageIndonesian => 'Bahasa Indonesia';

  @override
  String get settingsLanguagePortuguese => 'Português';

  @override
  String get settingsLanguageItalian => 'Italiano';

  @override
  String get settingsLanguageRussian => 'Русский';

  @override
  String get settingsLanguageHindi => 'हिन्दी';

  @override
  String get settingsLanguageJapanese => '日本語';

  @override
  String get settingsLanguageKorean => '한국어';

  @override
  String get settingsLanguageChinese => '简体中文';

  @override
  String get settingsLanguageUrdu => 'اردو';

  @override
  String get settingsLanguageDutch => 'Nederlands';

  @override
  String get settingsLanguageSwedish => 'Svenska';

  @override
  String get settingsLanguageNorwegian => 'Norsk bokmål';

  @override
  String get settingsLanguageDanish => 'Dansk';

  @override
  String get settingsLanguagePolish => 'Polski';

  @override
  String get settingsLanguageUkrainian => 'Українська';

  @override
  String get settingsLanguageCzech => 'Čeština';

  @override
  String get settingsLanguageHungarian => 'Magyar';

  @override
  String get settingsLanguageRomanian => 'Română';

  @override
  String get settingsLanguageFinnish => 'Suomi';

  @override
  String get settingsLanguageGreek => 'Ελληνικά';

  @override
  String get settingsLanguageMalay => 'Bahasa Melayu';

  @override
  String get tourSkip => 'Přeskočit';

  @override
  String get tourNext => 'Další';

  @override
  String get tourStart => 'Začít';

  @override
  String get tourHomeTitle => 'Domů';

  @override
  String get tourHomeBody =>
      'Zjisti na první pohled, kde dnes jsi — den cyklu, kolik zbývá do odhadovaného okna a tvůj společník jsou vždy tady.';

  @override
  String get tourCalendarTitle => 'Kalendář';

  @override
  String get tourCalendarBody =>
      'Sleduj své minulé i nadcházející cykly v kalendáři. Klepnutím na den otevřeš jeho záznam.';

  @override
  String get tourTrackTitle => 'Zaznamenat';

  @override
  String get tourTrackBody =>
      'Tlačítko + uprostřed odkudkoli otevře dnešní záznam — krvácení, příznaky, náladu a další.';

  @override
  String get tourRemindersTitle => 'Připomenutí';

  @override
  String get tourRemindersBody =>
      'Nastav si připomenutí na nadcházející menstruaci, léky nebo pití vody — vše zůstává v telefonu a nikam se neposílá.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Tady najdeš své přehledy, vše, co sleduješ, a svá nastavení.';

  @override
  String get settingsWeekStartLabel => 'Týden začíná';

  @override
  String get settingsWeekStartMonday => 'Pondělím';

  @override
  String get settingsWeekStartSunday => 'Nedělí';

  @override
  String get settingsTemperatureUnitLabel => 'Jednotka teploty';

  @override
  String get settingsTemperatureCelsius => 'Stupně Celsia';

  @override
  String get settingsTemperatureFahrenheit => 'Stupně Fahrenheita';

  @override
  String get settingsRemindersLabel => 'Připomenout před menstruací';

  @override
  String get remindersScreenTitle => 'Připomenutí';

  @override
  String get reminderDetailNotification => 'Oznámení';

  @override
  String get reminderDetailAlert => 'Upozornění';

  @override
  String get reminderDetailAlertToday => 'V daný den';

  @override
  String get reminderDetailTime => 'Čas';

  @override
  String get reminderDetailMessage => 'Zpráva';

  @override
  String get reminderDetailMessageEditTitle => 'Upravit zprávu';

  @override
  String get reminderDetailMessageHint => 'Napiš vlastní zprávu';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dní dříve',
      many: '$count dne dříve',
      few: '$count dny dříve',
      one: '$count den dříve',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count další';
  }

  @override
  String get optionsShowLess => 'Zobrazit méně';

  @override
  String get trackerHistoryEntry => 'Historie';

  @override
  String get actionSend => 'Odeslat';

  @override
  String get actionRemove => 'Odebrat';

  @override
  String get feedbackEntry => 'Zpětná vazba';

  @override
  String get cloudBackupEntry => 'Zálohovat s účtem';

  @override
  String get cloudBackupTitle => 'Zálohovat s účtem';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'V této verzi zatím není dostupné';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Cloudová záloha potřebuje účet, který pro tuto verzi zatím nebyl nastaven. Nic zde nelze použít, dokud nebude.';

  @override
  String get cloudBackupIntro1Title => 'Nikdy nepřijdeš o historii';

  @override
  String get cloudBackupIntro1Body =>
      'Historie tvého cyklu zůstane v bezpečí, i když ztratíš telefon nebo přejdeš na nový.';

  @override
  String get cloudBackupIntro2Title => 'Otevřít ji můžeš jen ty';

  @override
  String get cloudBackupIntro2Body =>
      'Tvoje záloha je zašifrována heslem ještě předtím, než opustí telefon — nemůžeme si ji přečíst my, ani nikdo jiný.';

  @override
  String get cloudBackupIntro3Title => 'Obnov během pár vteřin';

  @override
  String get cloudBackupIntro3Body =>
      'Přihlas se na novém zařízení a získej historii zpět se stejným heslem.';

  @override
  String get cloudBackupSignedInTitle => 'Přihlášeno';

  @override
  String get cloudBackupUploadButton => 'Zálohovat teď';

  @override
  String get cloudBackupDownloadButton => 'Obnovit z cloudu';

  @override
  String get cloudBackupUploadSuccess => 'Zálohováno do tvého účtu';

  @override
  String get cloudBackupNoBackupFound =>
      'Pro tento účet zatím nebyla nalezena žádná cloudová záloha.';

  @override
  String get partnerModeEntry => 'Režim partnera';

  @override
  String get partnerModeTitle => 'Režim partnera';

  @override
  String get partnerModeNotConfiguredTitle =>
      'V této verzi zatím není dostupné';

  @override
  String get partnerModeNotConfiguredBody =>
      'Režim partnera potřebuje účet, který pro tuto verzi zatím nebyl nastaven. Nic zde nelze použít, dokud nebude.';

  @override
  String get partnerModeHeroTitle => 'Sdílej trochu, za svých podmínek';

  @override
  String get partnerModeHeroBody =>
      'Spoj se se svým partnerem a sdílej jen to, co níže zapneš — nikdy celou historii, nikdy automaticky.';

  @override
  String get partnerModeSignInGoogle => 'Pokračovat přes Google';

  @override
  String get partnerModeSignInApple => 'Pokračovat přes Apple';

  @override
  String get partnerModeFaqTitle => 'Než se přihlásíš';

  @override
  String get partnerModeFaq1Q => 'Co přesně můj partner uvidí?';

  @override
  String get partnerModeFaq1A =>
      'Jen pole, která zapneš v Režimu partnera, a jen aktuální stav — nikdy uloženou historii a nikdy nic, co jsi výslovně nesdílela.';

  @override
  String get partnerModeFaq2Q => 'Můžu to později vypnout?';

  @override
  String get partnerModeFaq2A =>
      'Ano. Zrušení spojení okamžitě ukončí sdílení pro vás oba a kterýkoli přepínač můžeš kdykoli vypnout i bez zrušení spojení.';

  @override
  String get partnerModeFaq3Q => 'Potřebuje můj partner tuto aplikaci?';

  @override
  String get partnerModeFaq3A =>
      'Ano — přihlásí se stejným způsobem a spojí se pomocí kódu, který mu pošleš.';

  @override
  String get partnerModeNotPairedTitle => 'Zatím nespojeno';

  @override
  String get partnerModeNotPairedBody =>
      'Pozvi partnera jednorázovým kódem, nebo zadej kód, který ti poslal.';

  @override
  String get partnerModeInviteButton => 'Pozvat partnera';

  @override
  String get partnerModeEnterCodeButton => 'Zadat kód';

  @override
  String get partnerModeSignOut => 'Odhlásit se';

  @override
  String get partnerModePairedTitle => 'Spojeno';

  @override
  String get partnerModePairedBody =>
      'Ty a tvůj partner jste spojeni. Sdílí se stále jen to, co níže zapneš.';

  @override
  String get partnerModeShareSectionTitle => 'Co sdílíš';

  @override
  String get partnerModeShareCyclePhase => 'Fáze a den cyklu';

  @override
  String get partnerModeShareMood => 'Dnešní nálada';

  @override
  String get partnerModeShareSymptoms => 'Dnešní příznaky';

  @override
  String get partnerModeShareHighDesire => 'Dnešní touha po blízkosti';

  @override
  String get partnerModeShareNow => 'Sdílet teď';

  @override
  String get partnerModeShareSuccess => 'Sdíleno s partnerem';

  @override
  String get partnerModeUnpair => 'Zrušit spojení';

  @override
  String get partnerModeUnpairConfirmTitle => 'Zrušit spojení s partnerem?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Tím se okamžitě ukončí sdílení pro vás oba. Později se můžete znovu spojit novým kódem.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Tvůj partner zatím nic nesdílel.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Režim partnera v této verzi zatím není nastaven.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Tento kód nebyl nalezen. Zkontroluj ho a zkus to znovu.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Platnost tohoto kódu vypršela. Požádej o nový.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'To je tvůj vlastní kód — požádej partnera o jeho.';

  @override
  String get partnerModeErrorNotSignedIn => 'Nejdřív se přihlas.';

  @override
  String get partnerModeErrorUnknown =>
      'Něco se pokazilo. Zkus to prosím znovu.';

  @override
  String get partnerModeInviteTitle => 'Pozvi partnera';

  @override
  String get partnerModeInviteBody =>
      'Pošli tento kód svému partnerovi. Zadá ho ve své vlastní aplikaci, aby se s tebou spojil.';

  @override
  String get partnerModeInviteExpiry => 'Platí 7 dní';

  @override
  String get partnerModeInviteShare => 'Sdílet kód';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Tady je můj párovací kód pro Veru: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Zadat kód';

  @override
  String get partnerModeEnterBody => 'Zadej kód, který ti poslal partner.';

  @override
  String get partnerModeEnterHint => '6místný kód';

  @override
  String get partnerModeEnterSubmit => 'Spojit';

  @override
  String get homeInvitePartnerTitle => 'Sdílej se svým partnerem';

  @override
  String get homeInvitePartnerBody =>
      'Spojte se a sdílej jen to, co si vybereš — tvoje historie zůstává tvoje.';

  @override
  String get homeInvitePartnerCta => 'Nastavit Režim partnera';

  @override
  String get feedbackTitle => 'Co se ti nelíbilo?';

  @override
  String get feedbackSubtitle => 'Vyber téma a napiš víc, pokud chceš.';

  @override
  String get feedbackCategoryPredictions => 'Předpovědi';

  @override
  String get feedbackCategoryBackup => 'Záloha a obnovení';

  @override
  String get feedbackCategorySubscription => 'Předplatné';

  @override
  String get feedbackCategoryAds => 'Reklamy';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Překlad';

  @override
  String get feedbackCategoryOther => 'Jiné';

  @override
  String get feedbackDescriptionLabel => 'Řekni nám víc (nepovinné)';

  @override
  String get feedbackDescriptionHint =>
      'Co se stalo? Po klepnutí na Odeslat si vybereš, odkud to sdílíš — svou e-mailovou aplikaci nebo jinam.';

  @override
  String get feedbackAttachPhoto => 'Přidat fotku';

  @override
  String get feedbackPhotoAttached => 'Fotka přiložena';

  @override
  String get remindersGroupCycle => 'Menstruace a plodnost';

  @override
  String get remindersGroupMedication => 'Léky';

  @override
  String get remindersGroupLifestyle => 'Životní styl';

  @override
  String get remindersGroupAppointment => 'Návštěvy lékaře';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Ozvat se, až by menstruace měla končit';

  @override
  String get settingsRemindersMedicationLabel => 'Připomínka léků';

  @override
  String get settingsRemindersWaterLabel => 'Připomínka pitného režimu';

  @override
  String get settingsRemindersAppointmentLabel => 'Připomenutí návštěvy lékaře';

  @override
  String get settingsRemindersAppointmentSet => 'Nastavit datum a čas';

  @override
  String get settingsRemindersAppointmentClear => 'Vymazat';

  @override
  String get settingsOptionalTrackersHeading => 'Volitelné záznamy';

  @override
  String get settingsOptionalTrackersBody =>
      'Ve výchozím stavu vypnuté. Zapnutím se položka přidá na obrazovku denního záznamu.';

  @override
  String get settingsSexualActivityToggle => 'Sexuální aktivita';

  @override
  String get settingsBbtToggle => 'Bazální tělesná teplota';

  @override
  String get settingsMucusToggle => 'Cervikální hlen';

  @override
  String get settingsBreastExamToggle => 'Samovyšetření prsou';

  @override
  String get settingsCervixToggle => 'Poloha a pevnost děložního čípku';

  @override
  String get settingsPrivacyEntry => 'Soukromí';

  @override
  String get settingsRateEntry => 'Ohodnoťte nás';

  @override
  String get rateAppTitle => 'Funguje pro tebe Vera?';

  @override
  String get rateAppBody =>
      'Pokud ano, pár sekund na ohodnocení v obchodě pomůže ostatním, kteří hledají něco podobného, aby to vůbec našli.';

  @override
  String get rateAppCta => 'Ohodnotit Vera';

  @override
  String get rateAppDismiss => 'Teď ne';

  @override
  String get settingsDeleteAllData => 'Smazat všechna data';

  @override
  String get privacyScreenTitle => 'Soukromí';

  @override
  String get privacyScreenIntro =>
      'Tady je srozumitelně popsané, co přesně se s vašimi daty děje.';

  @override
  String get privacyScreenStorageTitle => 'Šifrováno v tomto zařízení';

  @override
  String get privacyScreenNoNetworkTitle => 'Žádný server, žádný účet';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Žádné sledování';

  @override
  String get privacyScreenExportTitle => 'Export jen na tvůj pokyn';

  @override
  String get privacyScreenDeleteTitle => 'Smazání je nevratné';

  @override
  String get privacyScreenStorage =>
      'Vše, co zaznamenáte, se zašifruje a uloží jen do tohoto zařízení, do jediného souboru. Šifrovací klíč je v zabezpečeném hardwaru telefonu — Keychain na iOS, Keystore na Androidu — ne v samotném souboru.';

  @override
  String get privacyScreenNoNetwork =>
      'Aplikace nemá vlastní server ani systém účtů — vaše záznamy se nikam neodesílají. Bezplatná verze obsahuje reklamy Google, které se připojují k internetu; nic z toho, co zaznamenáte, se k nim nedostane.';

  @override
  String get privacyScreenNoThirdParty =>
      'Žádná analytika, žádné hlášení pádů, žádné sledovací SDK. Jedinou součástí třetí strany je reklamní SDK od Googlu v bezplatné verzi — Premium ho odstraní úplně.';

  @override
  String get privacyScreenExport =>
      'Vaše data opustí toto zařízení jedině tehdy, když si je exportujete — a takový export je zašifrovaný heslem, které znáte jen vy.';

  @override
  String get privacyScreenDelete =>
      'Smazání dat je skutečné a okamžité. Na naší straně není žádný účet ani záloha — co je jednou pryč, je pryč.';

  @override
  String get adPlaceholderLabel => 'Reklamní prostor';

  @override
  String get adPlaceholderUpgradeCta => 'S Premium bez reklam';

  @override
  String get reminderNotificationTitle => 'Menstruace možná brzy začne';

  @override
  String get reminderNotificationBody =>
      'Podle zaznamenaných cyklů se blíží předpokládané okno.';

  @override
  String get reminderPeriodEndTitle => 'Menstruace se možná chýlí ke konci';

  @override
  String get reminderPeriodEndBody =>
      'Pokud ještě trvá, je to zcela běžné — jen se tiše ozýváme.';

  @override
  String get reminderMedicationTitle => 'Připomínka léků';

  @override
  String get reminderMedicationBody => 'Je čas si vzít léky.';

  @override
  String get reminderWaterTitle => 'Nezapomeňte pít';

  @override
  String get reminderWaterBody => 'Malá připomínka pitného režimu.';

  @override
  String get reminderAppointmentTitle => 'Blížící se návštěva lékaře';

  @override
  String get reminderAppointmentBody => 'Blíží se tvá návštěva lékaře.';

  @override
  String get settingsExportEntry => 'Export a záloha';

  @override
  String get exportBackupHeading => 'Šifrovaná záloha';

  @override
  String get exportBackupBody =>
      'Uložte si zašifrovanou kopii historie a přeneste ji do nového zařízení. K obnovení bude potřeba stejné heslo — jinak ho nelze nijak získat zpět.';

  @override
  String get exportCreateBackupButton => 'Vytvořit zálohu';

  @override
  String get exportRestoreBackupButton => 'Obnovit ze zálohy';

  @override
  String get exportPasswordLabel => 'Heslo';

  @override
  String get exportPasswordConfirmLabel => 'Potvrzení hesla';

  @override
  String get exportPasswordMismatch => 'Hesla se neshodují';

  @override
  String get exportPasswordTooShort => 'Použijte alespoň 8 znaků';

  @override
  String get exportRestoreConfirmTitle =>
      'Nahradit všechna data v tomto zařízení?';

  @override
  String get exportRestoreConfirmBody =>
      'Obnovením zálohy se nahradí vše, co je teď v tomto zařízení zaznamenané. Nejde to vzít zpět.';

  @override
  String get exportRestoreConfirmAction => 'Obnovit';

  @override
  String get exportWrongPassword => 'Toto heslo k této záloze nepatří';

  @override
  String get exportInvalidFile =>
      'Tento soubor nevypadá jako záloha z aplikace Vera';

  @override
  String get exportBackupCreated => 'Záloha je připravená ke sdílení';

  @override
  String get exportRestoreSuccess => 'Záloha obnovena';

  @override
  String get exportDoctorReportHeading => 'Zpráva pro lékaře';

  @override
  String get exportDoctorReportBody =>
      'Souhrn, který můžete předat zdravotníkovi.';

  @override
  String get exportIncludeNotesToggle => 'Zahrnout osobní poznámky';

  @override
  String get exportShareCsvButton => 'Sdílet jako CSV';

  @override
  String get exportPrintPdfButton => 'Tisk / uložit jako PDF';

  @override
  String get doctorReportDisclaimer =>
      'Vygenerováno aplikací Vera z údajů zadaných uživatelem. Nejde o lékařskou diagnózu.';

  @override
  String get doctorReportGeneratedOn => 'Vygenerováno dne';

  @override
  String get doctorReportSummaryHeading => 'Souhrn';

  @override
  String get doctorReportDailyLogHeading => 'Denní záznam';

  @override
  String get doctorReportColumnDate => 'Datum';

  @override
  String get doctorReportTimelineHeading => 'Časová osa cyklů';

  @override
  String get doctorReportCycleLabel => 'Cyklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruace';

  @override
  String get doctorReportTimelineLegendCycle => 'Zbytek cyklu';

  @override
  String get doctorReportTimelineOngoing => 'Probíhá';

  @override
  String get dailyInsightLabel => 'Zajímavost';

  @override
  String get insightMenstrual1 =>
      'Právě teď se odlučuje děložní sliznice — většina menstruací trvá 3 až 7 dní a to je zcela běžné.';

  @override
  String get insightMenstrual2 =>
      'Potraviny bohaté na železo, jako listová zelenina a čočka, mohou pomoci nahradit to, co tělo tento týden ztrácí.';

  @override
  String get insightFollicular1 =>
      'Estrogen stoupá a mnoho lidí zhruba od této chvíle pozoruje víc energie a lepší soustředění.';

  @override
  String get insightFollicular2 =>
      'Tělo připravuje vajíčko k uvolnění — tato fáze může trvat od jednoho týdne až po několik týdnů.';

  @override
  String get insightFertile1 =>
      'Toto je vaše odhadované plodné okno — dny kolem ovulace, kdy je otěhotnění podle obvyklého načasování nejpravděpodobnější.';

  @override
  String get insightFertile2 =>
      'Někteří lidé kolem ovulace pozorují mírný vzestup bazální tělesné teploty nebo změny cervikálního hlenu.';

  @override
  String get insightLuteal1 =>
      'Po ovulaci stoupá progesteron — právě tehdy se často objevují příznaky PMS, jako jsou změny nálady nebo nadýmání.';

  @override
  String get insightLuteal2 =>
      'Pokud nedošlo k uhnízdění embrya, ke konci této fáze hladiny hormonů klesnou a spustí další menstruaci.';

  @override
  String get insightUnknown1 =>
      'Délka cyklu se člověk od člověka hodně liší — za obvyklé se považuje rozmezí 21 až 35 dní.';

  @override
  String get insightsPhaseTipsTitle => 'V této fázi může dělat dobře';

  @override
  String get tipFitnessLabel => 'Pohyb';

  @override
  String get tipNutritionLabel => 'Výživa';

  @override
  String get tipFitnessMenstrual =>
      'Jemný pohyb — chůze, protahování nebo regenerační jóga — teď může dělat lépe než intenzivní trénink.';

  @override
  String get tipFitnessFollicular =>
      'V této fázi energie často stoupá — dobrá chvíle zkusit nový trénink nebo trochu přidat.';

  @override
  String get tipFitnessFertile =>
      'Mnoho lidí se tady cítí nejvíc při síle — dobrá fáze pro intenzivnější trénink, pokud vás láká.';

  @override
  String get tipFitnessLuteal =>
      'Pokud energie ke konci této fáze klesne, méně intenzivní posilování nebo plavání se dá zvládat lépe.';

  @override
  String get tipFitnessUnknown =>
      'Jakýkoli pohyb, který dnes dělá dobře, je dobrá volba — neexistuje jediná „správná“ rutina pro každý den.';

  @override
  String get tipNutritionMenstrual =>
      'Potraviny bohaté na železo, jako listová zelenina, čočka a červené maso, mohou pomoci nahradit to, co tělo tento týden ztrácí.';

  @override
  String get tipNutritionFollicular =>
      'Jak energie stoupá, často sedí lehčí a čerstvá jídla — ale neexistuje jediný „správný“ způsob, jak v této fázi jíst.';

  @override
  String get tipNutritionFertile =>
      'Dostatek tekutin a vyvážená jídla podpoří energii v této aktivněji působící fázi.';

  @override
  String get tipNutritionLuteal =>
      'Chutě se tady mohou měnit — často se sahá po složených sacharidech a potravinách bohatých na hořčík, jako jsou ořechy a hořká čokoláda.';

  @override
  String get tipNutritionUnknown =>
      'Vyvážená a pravidelná jídla jsou spolehlivý základ, dokud fáze ještě není jasná.';

  @override
  String get predictionSettingsEntry => 'Nastavení předpovědi';

  @override
  String get predictionSettingsIntro =>
      'Toto jsou předpoklady, otevřeně zobrazené. Po zaznamenání 2 celých cyklů se skutečná předpověď na úvodní obrazovce počítá z vašich vlastních dat — tato čísla se k tomu už nepoužívají.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Obvyklá délka menstruace';

  @override
  String get predictionSettingsCycleLengthLabel => 'Obvyklá délka cyklu';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Slouží k nastavení velikosti prstence na úvodní obrazovce, dokud nejsou k dispozici skutečná data.';

  @override
  String get predictionSettingsLutealLabel => 'Délka luteální fáze';

  @override
  String get predictionSettingsLutealHint =>
      'Obvyklý počet dní mezi ovulací a další menstruací. Slouží k umístění odhadovaného plodného okna — tento údaj se používá i poté, co začnou skutečné předpovědi.';

  @override
  String get dayLogEnergyLabel => 'Energie';

  @override
  String get energyLevelLow => 'Nízká';

  @override
  String get energyLevelMedium => 'Střední';

  @override
  String get energyLevelHigh => 'Vysoká';

  @override
  String get energyLevelEnergetic => 'Spousta energie';

  @override
  String get dayLogSkinHairLabel => 'Pleť a vlasy';

  @override
  String get skinHealthyGlow => 'Zdravý vzhled';

  @override
  String get skinRedness => 'Zarudnutí';

  @override
  String get skinDryness => 'Suchost';

  @override
  String get skinOiliness => 'Mastnota';

  @override
  String get hairGoodDay => 'Vlasy v pořádku';

  @override
  String get hairBadDay => 'Vlasy nespolupracují';

  @override
  String get hairLoss => 'Vypadávání vlasů';

  @override
  String get scalpOily => 'Mastná pokožka hlavy';

  @override
  String get dayLogBreastExamLabel => 'Samovyšetření prsou';

  @override
  String get breastExamAllNormal => 'Nic neobvyklého';

  @override
  String get breastExamLump => 'Bulka';

  @override
  String get breastExamIndentation => 'Vtažení kůže';

  @override
  String get breastExamRedness => 'Zarudnutí';

  @override
  String get breastExamCrackedNipple => 'Popraskaná bradavka';

  @override
  String get breastExamDischarge => 'Výtok z bradavky';

  @override
  String get cervixPositionLabel => 'Poloha děložního čípku';

  @override
  String get cervixPositionLow => 'Nízko';

  @override
  String get cervixPositionMedium => 'Středně';

  @override
  String get cervixPositionHigh => 'Vysoko';

  @override
  String get cervixOpeningLabel => 'Otevření děložního čípku';

  @override
  String get cervixOpeningClosed => 'Zavřený';

  @override
  String get cervixOpeningMedium => 'Částečně otevřený';

  @override
  String get cervixOpeningOpen => 'Otevřený';

  @override
  String get cervixFirmnessLabel => 'Pevnost děložního čípku';

  @override
  String get cervixFirmnessSoft => 'Měkký';

  @override
  String get cervixFirmnessMedium => 'Středně pevný';

  @override
  String get cervixFirmnessFirm => 'Pevný';

  @override
  String get dayLogWaterLabel => 'Pitný režim';

  @override
  String get dayLogSleepLabel => 'Spánek';

  @override
  String get dayLogWeightLabel => 'Hmotnost';

  @override
  String get dayLogMedicationsLabel => 'Léky';

  @override
  String get dayLogAddMedication => 'Přidat lék';

  @override
  String get dayLogMedicationNameHint => 'Název léku';

  @override
  String get dayLogBirthControlLabel => 'Antikoncepce';

  @override
  String get dayLogOtherMedicationsLabel => 'Jiné léky';

  @override
  String get birthControlPillTaken => 'Pilulka užita';

  @override
  String get birthControlPillLate => 'Pilulka užita pozdě';

  @override
  String get birthControlPillMissed => 'Pilulka vynechána';

  @override
  String get birthControlPatch => 'Náplast';

  @override
  String get birthControlRing => 'Kroužek';

  @override
  String get birthControlInjection => 'Injekce';

  @override
  String get birthControlImplant => 'Implantát';

  @override
  String get birthControlIud => 'Nitroděložní tělísko';

  @override
  String get navAssistant => 'Otázky';

  @override
  String get assistantTitle => 'Vera: otázky a odpovědi';

  @override
  String get assistantEndChatTitle => 'Ukončit tento chat?';

  @override
  String get assistantEndChatBody =>
      'Zprávy jsou jen v paměti a nikam se neukládají, takže je nelze obnovit.';

  @override
  String get assistantEndChatConfirm => 'Ukončit chat';

  @override
  String get assistantInputHint => 'Zeptejte se na svůj cyklus…';

  @override
  String get assistantIntro =>
      'Vítejte! Tady najdete odpovědi na otázky o menstruaci, cyklu a o tom, jak Vera funguje — přímo v telefonu, nic neopouští toto zařízení. Odpovědi vycházejí ze znalostní databáze uložené v zařízení; nejde o lékařskou radu a nenahrazují lékaře.';

  @override
  String get insightMenstrual3 =>
      'Menstruační krev není „špinavá krev“ — je to směs krve a děložní sliznice, zcela běžná součást cyklu.';

  @override
  String get insightMenstrual4 =>
      'Mírné teplo na podbřišku křeče opravdu zmírňuje — termofor je klasika podložená důkazy.';

  @override
  String get insightMenstrual5 =>
      'Krvácení bývá nejsilnější první dva dny a pak slábne — takový průběh je obvyklý.';

  @override
  String get insightMenstrual6 =>
      'Větší únava během menstruace je běžná — s menstruační krví tělo ztrácí železo.';

  @override
  String get insightFollicular3 =>
      'Estrogen po menstruaci znovu buduje děložní sliznici — tělo začíná nanovo.';

  @override
  String get insightFollicular4 =>
      'Jak se hladiny hormonů ustálí, pleť v této fázi bývá nejčistší.';

  @override
  String get insightFollicular5 =>
      'U mnoha lidí je vytrvalost a reakční doba nejlepší v pozdní folikulární fázi.';

  @override
  String get insightFollicular6 =>
      'Právě délka této fáze se mezi lidmi liší nejvíc — luteální fáze je mnohem stálejší.';

  @override
  String get insightFertile3 =>
      'Vajíčko přežívá asi 12–24 hodin, ale spermie mohou vyčkávat až 5 dní — proto plodné okno zabírá několik dní.';

  @override
  String get insightFertile4 =>
      'Kolem ovulace bývá cervikální hlen průhledný a tažný — jako syrový vaječný bílek.';

  @override
  String get insightFertile5 =>
      'Někteří lidé při ovulaci cítí krátké bodnutí na jedné straně — má to i svůj název: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Bazální tělesná teplota mírně stoupá až *po* ovulaci — spíš ji tedy potvrzuje, než předpovídá.';

  @override
  String get insightLuteal3 =>
      'Progesteron vrcholí zhruba týden po ovulaci — nadýmání a citlivost prsou jsou v té době běžné.';

  @override
  String get insightLuteal4 =>
      'Chuť na sacharidy před menstruací je skutečná — v luteální fázi mírně stoupá potřeba energie.';

  @override
  String get insightLuteal5 =>
      'Příznaky PMS obvykle ustoupí do jednoho až dvou dnů po začátku krvácení.';

  @override
  String get insightLuteal6 =>
      'Pravidelný spánkový režim může znatelně zmírnit propady nálady v pozdní luteální fázi.';

  @override
  String get insightUnknown2 =>
      'Často stačí sledovat tři cykly, aby se ukázal vlastní vzorec.';

  @override
  String get insightUnknown3 =>
      'Cyklus je individuální — srovnávat ten svůj s cyklem někoho jiného málokdy k něčemu vede.';

  @override
  String get insightUnknown4 =>
      'Stres, cestování i nemoc mohou posunout ovulaci — „opožděná“ menstruace často znamená jen pozdější ovulaci.';

  @override
  String get settingsThemeLabel => 'Motiv';

  @override
  String get settingsThemeSystem => 'Podle systému';

  @override
  String get settingsThemeLight => 'Světlý';

  @override
  String get settingsThemeDark => 'Tmavý';

  @override
  String get settingsMascotLabel => 'Maskot';

  @override
  String get mascotDroplet => 'Kapka';

  @override
  String get mascotFlower => 'Květina';

  @override
  String get mascotMoon => 'Měsíc';

  @override
  String get mascotNone => 'Žádný';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Předpokládané okno začne přibližně za $days dní',
      many: 'Předpokládané okno začne přibližně za $days dne',
      few: 'Předpokládané okno začne přibližně za $days dny',
      one: 'Předpokládané okno začne přibližně za $days den',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Odhadovaná ovulace přibližně za $days dní',
      many: 'Odhadovaná ovulace přibližně za $days dne',
      few: 'Odhadovaná ovulace přibližně za $days dny',
      one: 'Odhadovaná ovulace přibližně za $days den',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Jak se dnes vaše tělo cítí?';

  @override
  String get actionSave => 'Uložit';

  @override
  String get insightsTrackerHubTitle => 'Vaše záznamy';

  @override
  String get trackerHistoryEmpty => 'V tomto období zatím nejsou žádné záznamy';

  @override
  String get trackerStatAverage => 'Průměr';

  @override
  String get trackerStatLowest => 'Nejnižší';

  @override
  String get trackerStatHighest => 'Nejvyšší';

  @override
  String get trackerStatLatest => 'Poslední';

  @override
  String get rangeFilter1m => '1 měs.';

  @override
  String get rangeFilter3m => '3 měs.';

  @override
  String get rangeFilter6m => '6 měs.';

  @override
  String get dayLogOvulationTestLabel => 'Ovulační test';

  @override
  String get ovulationTestNegative => 'Negativní';

  @override
  String get ovulationTestPositive => 'Pozitivní';

  @override
  String get ovulationTestLow => 'Nízká';

  @override
  String get ovulationTestHigh => 'Vysoká';

  @override
  String get ovulationTestPeak => 'Vrchol';

  @override
  String get pregnancyTestLabel => 'Těhotenský test';

  @override
  String get pregnancyTestPositive => 'Pozitivní';

  @override
  String get pregnancyTestFaint => 'Slabá čárka';

  @override
  String get pregnancyTestNegative => 'Negativní';

  @override
  String get settingsOvulationTestToggle => 'Ovulační test';

  @override
  String get settingsRemindersOvulationLabel => 'Upozornění na plodné okno';

  @override
  String get reminderOvulationTitle => 'Blíží se odhadované plodné okno';

  @override
  String get reminderOvulationBody =>
      'Podle zaznamenaných cyklů může odhadované plodné okno brzy začít.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamů',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '$count záznam',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Při tak málo záznamech nejsou procenta zatím spolehlivá — zpřesní se s dalšími záznamy.';

  @override
  String get assistantTyping => 'Vera píše…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Všechny funkce pro sledování zůstávají navždy zdarma — vaše historie se nikdy nezamyká. Premium přidává vlastní záznamy, hlubší přehledy, vlastní připomínky a další vzhledy a odstraňuje reklamy.';

  @override
  String get premiumBenefitNoAds => 'Žádné reklamy, nikde v aplikaci';

  @override
  String get premiumBenefitSupport =>
      'Podpora nezávislé aplikace, která staví soukromí na první místo';

  @override
  String get premiumMonthly => 'Měsíčně';

  @override
  String get premiumYearly => 'Ročně';

  @override
  String get premiumYearlyNote => 'Účtováno jednou ročně';

  @override
  String premiumPerMonth(String price) {
    return '$price / měsíc';
  }

  @override
  String get premiumBilledMonthly => 'Účtováno měsíčně';

  @override
  String get premiumStaysFreeTitle => 'Co zůstává zdarma';

  @override
  String get premiumStaysFreeBody =>
      'Kalendář, celá tvoje historie, základní statistiky a export zůstávají navždy zdarma. Premium věci přidává, nikdy nic nebere.';

  @override
  String get premiumSubscribeCta => 'Pokračovat';

  @override
  String get premiumRestore => 'Obnovit nákup';

  @override
  String get premiumCancelNote =>
      'Předplatné lze kdykoli zrušit v účtu obchodu s aplikacemi. Žádné odpočty, žádný nátlak — pokud teď není ta pravá chvíle, bezplatná verze funguje dál přesně tak jako dnes.';

  @override
  String get premiumActiveBadge => 'Premium je aktivní';

  @override
  String get premiumDevToggle => 'Simulovat Premium (vývoj)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice =>
      'Testovací reklama — zatím nejde o skutečné umístění';

  @override
  String get settingsPregnancyModeLabel => 'Režim těhotenství';

  @override
  String get pregnancyLmpLabel => 'První den poslední menstruace';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return '$weeks. týden, $days. den';
  }

  @override
  String get pregnancyDueDateLabel => 'Předpokládaný termín porodu';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Zbývá přibližně $days dní',
      many: 'Zbývá přibližně $days dne',
      few: 'Zbývají přibližně $days dny',
      one: 'Zbývá přibližně $days den',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n. trimestr';
  }

  @override
  String get pregnancyDisclaimer =>
      'Data se odhadují z poslední menstruace podle standardního pravidla 280 dní. Ultrazvuk určí termín přesněji a pozdější ovulace tato čísla posouvá — jde o informaci, ne o zdravotní péči.';

  @override
  String get pregnancySizeLabel => 'Velikost miminka';

  @override
  String get pregnancySizeUnder5 => 'Mák (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Borůvka (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limetka (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avokádo (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Meloun cantaloupe (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Malý meloun (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Většina lidí zatím nic nepozoruje — protože se gestační stáří počítá od poslední menstruace, první dva týdny ve skutečnosti předcházejí početí.';

  @override
  String get pregnancyNoteUnder9 =>
      'Nevolnost, citlivost prsou a únava jsou teď běžné. Dobrá chvíle domluvit si první návštěvu u lékaře.';

  @override
  String get pregnancyNoteUnder13 =>
      'Blíží se konec prvního trimestru; u mnoha lidí nevolnost zhruba v této době ustupuje.';

  @override
  String get pregnancyNoteUnder20 =>
      'V tomto období se často vrací energie. První pohyby bývají cítit kdykoli mezi 16. a 22. týdnem.';

  @override
  String get pregnancyNoteUnder28 =>
      'Pohyby jsou zřetelnější a začínají mít svůj rytmus. Bolesti zad a pálení žáhy jsou v tomto období běžné.';

  @override
  String get pregnancyNoteUnder34 =>
      'Začal třetí trimestr. Dušnost, časté močení a Braxtonovy-Hicksovy kontrakce jsou běžné.';

  @override
  String get pregnancyNoteUnder38 =>
      'Miminko se připravuje na porod. Dobrá chvíle na tašku do porodnice a porodní plán.';

  @override
  String get pregnancyNoteTerm =>
      'Těhotenství je v termínu — porod může přijít kdykoli mezi 37. a 42. týdnem; 40. týden je průměr, ne konečné datum.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Tento týden';

  @override
  String get pregnancyNeedsLmp =>
      'Pro zahájení sledování zadejte první den poslední menstruace.';

  @override
  String get pregnancyOutOfRange =>
      'Toto datum je starší než 42 týdnů — upravte ho, nebo režim těhotenství vypněte.';

  @override
  String get partnerShareTitle => 'Sdílet souhrn s blízkou osobou';

  @override
  String get partnerShareBody =>
      'Vytvoří krátký textový souhrn — aktuální fázi a předpokládané okno — který pak odešlete libovolnou aplikací. Není tu žádná živá synchronizace ani účet pro druhou osobu: nic se nesdílí, dokud to neodešlete.';

  @override
  String get partnerShareCta => 'Vytvořit souhrn';

  @override
  String get partnerSummaryHeader => 'Souhrn cyklu z aplikace Vera';

  @override
  String get settingsHomeThemeLabel => 'Pozadí úvodní obrazovky';

  @override
  String get homeThemeWheat => 'Pšenice';

  @override
  String get homeThemeSky => 'Obloha';

  @override
  String get homeThemeField => 'Pole';

  @override
  String get homeThemeBlossom => 'Květ';

  @override
  String get homeThemePlain => 'Jednoduché';

  @override
  String get backupNudgeTitle => 'Uchovejte si kopii svých dat';

  @override
  String get backupNudgeBody =>
      'Všechno je jen v tomto telefonu. Když se ztratí, rozbije nebo se obnoví do továrního nastavení, zmizí s ním i vaše historie — zašifrovaná záloha zabere chvíli a otevřít ji můžete jen vy.';

  @override
  String get backupNudgeCta => 'Zálohovat teď';

  @override
  String get backupNudgeDismiss => 'Později';

  @override
  String backupLastDone(String date) {
    return 'Poslední záloha: $date';
  }

  @override
  String get backupNever => 'Zatím žádná záloha';

  @override
  String get settingsRemindersBackupLabel => 'Připomenout zálohování';

  @override
  String get reminderBackupTitle => 'Čas zálohovat aplikaci Vera';

  @override
  String get reminderBackupBody =>
      'Vaše historie existuje jen v tomto telefonu. Rychlá zašifrovaná záloha ji ochrání.';

  @override
  String get notificationChannelPeriodStart => 'Blížící se menstruace';

  @override
  String get notificationChannelPeriodEnd => 'Konec menstruace';

  @override
  String get notificationChannelMedication => 'Léky';

  @override
  String get notificationChannelWater => 'Pitný režim';

  @override
  String get notificationChannelAppointment => 'Schůzky';

  @override
  String get notificationChannelOvulation => 'Plodné okno';

  @override
  String get notificationChannelBackup => 'Připomínka zálohování';

  @override
  String get calendarDayDetailTitle => 'Tento den';

  @override
  String get calendarDayNothingLogged =>
      'K tomuto dni zatím není nic zaznamenáno';

  @override
  String get calendarDayOpenLog => 'Otevřít denní záznam';

  @override
  String get cycleHistoryTitle => 'Předchozí cykly';

  @override
  String get cycleTrendsTitle => 'Trendy cyklu';

  @override
  String get cycleHistoryEmpty =>
      'Zaznamenejte pár menstruací a objeví se tu historie vašich cyklů.';

  @override
  String get cycleHistoryOngoing => 'Probíhá';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cyklus dlouhý $days dní',
      many: 'Cyklus dlouhý $days dne',
      few: 'Cyklus dlouhý $days dny',
      one: 'Cyklus dlouhý $days den',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Menstruace trvala $days dní',
      many: 'Menstruace trvala $days dne',
      few: 'Menstruace trvala $days dny',
      one: 'Menstruace trvala $days den',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff oproti vašemu průměru';
  }

  @override
  String get insightsCycleHistoryEntry => 'Předchozí cykly';

  @override
  String get homeEmptyTitle => 'Začněme poslední menstruací';

  @override
  String get homeEmptyBody =>
      'V den, kdy menstruace začne, klepněte na tlačítko nahoře. Po dvou celých cyklech začne Vera odhadovat — do té doby nebude předstírat, že to ví.';

  @override
  String get homeEmptyBackdate => 'Začala už dřív';

  @override
  String get settingsAdPrivacyEntry => 'Nastavení soukromí u reklam';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Den cyklu $day z přibližně $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Graf s $count záznamy, od $min do $max',
      many: 'Graf s $count záznamu, od $min do $max',
      few: 'Graf s $count záznamy, od $min do $max',
      one: 'Graf s $count záznamem, od $min do $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Průběh cyklu: den $day z přibližně $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count výskytů',
      many: '$count výskytu',
      few: '$count výskyty',
      one: '$count výskyt',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Import z jiné aplikace';

  @override
  String get importBody =>
      'Vyexportujte historii ze své dosavadní aplikace jako CSV a pak tady soubor vyberte. Importují se jen data a intenzita krvácení — pojmenování příznaků a nálad se mezi aplikacemi liší a Vera nebude hádat, co které označení znamená.';

  @override
  String get importPickFile => 'Vybrat soubor CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nalezeno $count dní historie',
      many: 'Nalezeno $count dne historie',
      few: 'Nalezeny $count dny historie',
      one: 'Nalezen $count den historie',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count řádků se nepodařilo přečíst a bude vynecháno',
      many: '$count řádku se nepodařilo přečíst a bude vynecháno',
      few: '$count řádky se nepodařilo přečíst a budou vynechány',
      one: '$count řádek se nepodařilo přečíst a bude vynechán',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Přidat do mé historie';

  @override
  String get importMergeNote =>
      'Importované dny se sloučí s existujícími. Dny, které už jsou ve Veře zaznamenané, zůstanou beze změny.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importováno $count dní',
      many: 'Importováno $count dne',
      few: 'Importovány $count dny',
      one: 'Importován $count den',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Tento soubor vypadá prázdně.';

  @override
  String get importErrorNoDate =>
      'V souboru se nepodařilo najít sloupec s datem.';

  @override
  String get settingsImportEntry => 'Import z jiné aplikace';

  @override
  String get settingsHealthSyncLabel =>
      'Synchronizace s Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Do zdravotní aplikace v telefonu zapisuje jen intenzitu krvácení, hmotnost a bazální teplotu. Příznaky, nálady a poznámky zůstávají ve Veře. Nic se nečte zpět.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Do zdravotní aplikace odesláno $count dní',
      many: 'Do zdravotní aplikace odesláno $count dne',
      few: 'Do zdravotní aplikace odeslány $count dny',
      one: 'Do zdravotní aplikace odeslán $count den',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Oprávnění nebylo uděleno, synchronizace proto zůstává vypnutá.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostika';

  @override
  String get diagnosticsBody =>
      'Když se aplikace zachová nečekaně, zaznamenají se sem technické podrobnosti — jen v tomto zařízení. Nic se nikam neodešle, dokud to sami nezvolíte, a předem si můžete přesně přečíst, co by se odesílalo.';

  @override
  String get diagnosticsEmpty =>
      'Nic není zaznamenáno — žádné problémy nebyly zjištěny.';

  @override
  String get diagnosticsShare => 'Odeslat vývojáři';

  @override
  String get diagnosticsClear => 'Vymazat';

  @override
  String get diagnosticsNoteLabel => 'Co se stalo? (nepovinné)';

  @override
  String get diagnosticsTechnicalDetail => 'Technické podrobnosti';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'hodin';

  @override
  String get unitMinutesLong => 'minut';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Přejít na měsíc';

  @override
  String get calendarJumpYearLabel => 'Rok';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Ve vašem regionu se volby personalizace reklam nenabízejí — reklamy tu už personalizované nejsou.';

  @override
  String get settingsGroupAppearance => 'Vzhled';

  @override
  String get settingsGroupTracking => 'Předvolby sledování';

  @override
  String get dayLogCustomTagsLabel => 'Moje vlastní záznamy';

  @override
  String get customTagAddButton => 'Přidat záznam';

  @override
  String get customTagDialogTitle => 'Nový záznam';

  @override
  String get customTagDialogHint => 'např. migréna, posilovna, nespavost';

  @override
  String get customTagManageEntry => 'Spravovat moje záznamy';

  @override
  String get customTagRenameTitle => 'Přejmenovat záznam';

  @override
  String get customTagDeleteTitle => 'Smazat tento záznam?';

  @override
  String get customTagDeleteBody =>
      'Odstraní se ze všech dnů, kde byl použit. Ostatní záznamy zůstanou beze změny.';

  @override
  String get customTagEmpty => 'Zatím žádné vlastní záznamy.';

  @override
  String get premiumLockedTitle => 'Funkce Premium';

  @override
  String get premiumLockedAction => 'Zobrazit Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Sledujte cokoli chcete, vlastními slovy';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Pokročilé přehledy: co se obvykle děje a kdy';

  @override
  String get premiumBenefitPersonalisation => 'Další pozadí a maskoti';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Připomínky podle vlastního rozvrhu';

  @override
  String get advancedInsightsTitle => 'Pokročilé přehledy';

  @override
  String get advancedInsightsEntry => 'Pokročilé přehledy';

  @override
  String get advancedInsightsNotEnough =>
      'Zaznamenejte tři celé cykly a objeví se tu vaše vzorce. Při menším počtu by každý „vzorec“ byl jen náhoda.';

  @override
  String get advancedInsightsPatternsTitle => 'Kdy se věci obvykle objevují';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — nejčastěji $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zaznamenaných dní, přibližně $day. den cyklu',
      many: '$count zaznamenaného dne, přibližně $day. den cyklu',
      few: '$count zaznamenané dny, přibližně $day. den cyklu',
      one: '$count zaznamenaný den, přibližně $day. den cyklu',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — zatím bez jasného načasování';
  }

  @override
  String get advancedInsightsTrendTitle => 'Délka cyklu v čase';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Při srovnání vašich nejstarších $cycles cyklů s posledními $cycles jsou ty novější asi o $days dní delší.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Při srovnání vašich nejstarších $cycles cyklů s posledními $cycles jsou ty novější asi o $days dní kratší.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Při srovnání vašich nejstarších $cycles cyklů s posledními $cycles zůstala délka cyklu zhruba stejná.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Až bude k dispozici šest celých cyklů, Vera dokáže porovnat ty nejstarší s nejnovějšími a ukázat, zda se délka cyklu posouvá.';

  @override
  String get advancedInsightsMoodTitle => 'Nálada podle části cyklu';

  @override
  String get advancedInsightsDisclaimer =>
      'Jde jen o počty toho, co bylo zaznamenáno, nic víc. Není to diagnóza a vzorec tady neznamená příčinu.';

  @override
  String get segmentPeriod => 'během menstruace';

  @override
  String get segmentAfterPeriod => 'po menstruaci';

  @override
  String get segmentMidCycle => 'uprostřed cyklu';

  @override
  String get segmentBeforePeriod => 'před menstruací';

  @override
  String get customRemindersEntry => 'Moje připomínky';

  @override
  String get customRemindersTitle => 'Moje připomínky';

  @override
  String get customRemindersEmpty => 'Zatím žádné vlastní připomínky.';

  @override
  String get customRemindersAdd => 'Přidat připomínku';

  @override
  String get customReminderLabelHint => 'např. vzít si lék, napít se';

  @override
  String get customReminderLockScreenNote =>
      'Text připomínky se zobrazí na uzamčené obrazovce — zvolte ho tak, aby vám to bylo příjemné.';

  @override
  String get customReminderDelete => 'Smazat připomínku';

  @override
  String get homeThemeDusk => 'Soumrak';

  @override
  String get homeThemeMeadow => 'Louka';

  @override
  String get homeThemePetal => 'Okvětní lístek';

  @override
  String get homeThemeBloom => 'Rozkvět';

  @override
  String get homeThemeOcean => 'Oceán';

  @override
  String get homeThemeAutumn => 'Podzim';

  @override
  String get homeThemeNight => 'Noc';

  @override
  String get mascotStar => 'Hvězda';

  @override
  String get mascotLeaf => 'List';

  @override
  String get mascotCat => 'Kočka';

  @override
  String get mascotRabbit => 'Králík';

  @override
  String get mascotBird => 'Ptáček';

  @override
  String get tipDetailWhatsHappening => 'Co se děje ve vašem těle';

  @override
  String get tipDetailGeneralHeading => 'Obecná doporučení';

  @override
  String get tipDetailDisclaimer =>
      'Jde o obecné informace, ne o osobní lékařskou radu. Každé tělo reaguje jinak a to, jak se doopravdy cítíte, váží víc než cokoli navrženého tady. Pokud vás něco znepokojuje, obraťte se na lékaře.';

  @override
  String get phaseExplainerMenstrual =>
      'Krvácíš, protože se odlupuje děložní sliznice. Estrogen a progesteron jsou na nejnižší úrovni cyklu, a proto se řada lidí první dny cítí unavenější a víc obrácená dovnitř. Krvácení trvá obvykle tři až sedm dní a je nejsilnější na začátku. Křeče vznikají stahováním dělohy, které pohánějí prostaglandiny — látky podobné hormonům, uvolňované při rozpadu sliznice, což je také důvod, proč někoho zároveň bolí kříž nebo má řidší stolici. Krvácení navíc stojí železo, a to vysvětluje část únavy. Teplo, pohyb a spánek obvykle pomáhají. Pokud se ale ochrana promáčí každou hodinu, krvácení zřetelně přesahuje týden nebo bolest brání běžným věcem, stojí za to to probrat s lékařem místo čekání, až to přejde.';

  @override
  String get phaseExplainerFollicular =>
      'Po skončení krvácení začne estrogen znovu stoupat. Ve vaječnících dozrává skupina folikulů, každý s jedním vajíčkem, a obvykle se uvolní jen jedno. Estrogen znovu buduje sliznici, která se právě odloučila, a většina lidí si všimne, že se s ním vrací energie, nálada, pleť i výdrž. Tohle je zároveň část cyklu, která se nejvíc liší mezi lidmi i mezi měsíci — stres, nemoc, cestování a spánek se projeví většinou právě tady, tím, že ji prodlouží nebo zkrátí. To je poctivý důvod, proč je předpověď rozmezí a ne datum: druhá polovina cyklu je poměrně stálá a hýbe se právě tahle.';

  @override
  String get phaseExplainerFertile =>
      'Estrogen je blízko svého vrcholu a ovulace se očekává kolem těchto dnů. Vzestup luteinizačního hormonu spustí uvolnění vajíčka zhruba za den až den a půl. Samotné vajíčko přežívá asi 12 až 24 hodin, ale spermie mohou v plodném hlenu děložního hrdla přežít několik dní — proto se okno počítá na několik dní, ne na jeden. Hlen bývá čirý, tažný a kluzký, trochu jako syrový bílek; někdo zaznamená větší chuť, citlivá prsa nebo krátké píchnutí na jedné straně. Energie bývá na nejvyšším bodě cyklu. Pamatuj, že tohle okno je odhad z tvé vlastní historie, ne měření, a není to antikoncepční metoda.';

  @override
  String get phaseExplainerLuteal =>
      'Po ovulaci se z prázdného folikulu stane žluté tělísko a začne produkovat progesteron, který udržuje sliznici stabilní pro případ, že se uhnízdí těhotenství. Pokud se tak nestane, progesteron i estrogen prudce klesnou a přijde menstruace. Tahle polovina cyklu je stálejší, obvykle kolem 12 až 14 dní. Progesteron mírně zvedne klidovou teplotu — právě tuhle změnu zachytí bazální teploměr — a může zpomalit trávení, což vysvětluje část nadýmání. Pokles na konci je to, co u mnoha lidí spouští PMS: citlivá prsa, změny chuti k jídlu, přerušovaný spánek, bolesti hlavy a výkyvy nálad, které obvykle poleví, jakmile začne krvácení. Pokud tyhle potíže většinu měsíců narušují práci nebo vztahy, stojí za to je probrat s lékařem.';

  @override
  String get phaseExplainerUnknown =>
      'Zatím není zaznamenáno dost na to, aby se dalo říct, v jaké fázi jsi. Vera potřebuje aspoň dva úplné cykly — začátek menstruace a pak ten další — aby spočítala tvůj vlastní průměr a rozptyl, a raději to řekne, než aby si fázi vymyslela. Nic se přitom neztrácí: každý zapsaný den patří do toho prvního výpočtu a odhad se zužuje, jak historie roste. Do té doby jsou návrhy níže obecné a platí v kterémkoli bodě cyklu.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Tvrdý trénink většině lidí první dny nesedí a není to otázka disciplíny — energie je opravdu nižší a železo, které odchází s krvácením, dělá vytrvalostní práci těžší, než jak stejná jednotka působila minulý týden. Chůze, jemné protahování, regenerační jóga a dechová práce zlepšují prokrvení a mohou křeče zmírnit; u někoho snižuje pravidelný pohyb v průběhu celého měsíce intenzitu křečí víc než cokoli, co udělá v ten den. Když se cítíš dobře, není důvod se tvrdým jednotkám vyhýbat: krvácení není důvod přestat trénovat a spousta sportovkyň v jeho průběhu závodí. Pár praktických poznámek: dlouhé a náročné jednotky ve dnech silného krvácení mohou únavu prohloubit, teplo na podbřišek před začátkem udělá pohyb pohodlnějším a pití o něco víc než obvykle pomáhá na bolesti hlavy těchto dnů. Posuzuj trénink podle toho, jak se v něm cítíš, ne podle toho, jak vypadal tvůj nejlepší týden.';

  @override
  String get tipFitnessDetailFollicular =>
      'Jak estrogen stoupá, většina lidí se cítí silnější a odolnější; tohle bývá nejlepší úsek cyklu na to začít něco nového, přidat zátěž nebo zrychlit. Obnova svalů je tady poměrně efektivní, takže se tvrdé jednotky lépe vstřebávají a nechávají po sobě míň přetrvávající bolesti. Je to i dobré okno na to, co vyžaduje jasnou hlavu, ne jen silné tělo — naučit se nový pohyb, opravit techniku nebo zaběhnout delší trať než dosud. Dvě výhrady stojí za to podržet: přidávej postupně, protože hodně energie neznamená nulové riziko zranění a většina přetížení začíná v dobrém týdnu, ne ve špatném. A chraň si spánek — adaptace probíhá při regeneraci, ne během tréninku.';

  @override
  String get tipFitnessDetailFertile =>
      'Energie i motivace bývají na vrcholu, takže náročné jednotky sedí dobře — osobní rekordy padají často právě tady. Některé studie naznačují, že klouby jsou kolem ovulace o něco volnější; praktický dopad se probírá, ale delší rozehřátí je levná pojistka u sportů s prudkými změnami směru, výskoky a doskoky. Tělesná teplota je pořád nízká oproti druhé polovině cyklu, takže horko tady omezuje míň, než bude za týden nebo dva. Krátké píchnutí na jedné straně podbřišku kolem ovulace je běžné a obvykle odezní během hodin. Pokud je ale bolest silná, jednostranná a přetrvává, přidá se horečka nebo máš pocit na omdlení — přestaň a nech si to zkontrolovat místo toho, abys trénovala dál.';

  @override
  String get tipFitnessDetailLuteal =>
      'Jak se blíží menstruace, energie může klesnout, tep může být při stejné zátěži vyšší a regenerace může trvat déle. Je to očekávané kolísání, ne propad, a nemaže to práci posledních dvou týdnů. Progesteron mírně zvedá klidovou teplotu a ztěžuje odvod tepla, takže jednotky v horku nebo vlhku působí tady nepoměrně těžce — trénovat dřív nebo později během dne a pít víc, než se zdá nutné, pomáhá obojí. Střední jednotky, o něco lehčí verze silového tréninku a chůze bývají udržitelnější. Při nadýmání a citlivých prsou udělá dobře podpírající sportovní podprsenka a delší rozehřátí opravdový rozdíl. Když je nálada dole, udělej jednotku krátkou a lehkou místo toho, abys ji úplně vynechala — laťka pro to, aby se počítala, je níž, než se zdá.';

  @override
  String get tipFitnessDetailUnknown =>
      'I bez znalosti fáze pomáhá pohyb kdykoli: obecné doporučení je asi 150 minut středně náročné aktivity týdně, rozložených do většiny dní, plus posilování dvakrát týdně — a tenhle vzorec dává skoro každému víc než občasné velmi intenzivní jednotky. Pravidelnost váží víc než intenzita a nejlepší jednotka je ta, kterou příští týden opravdu zopakuješ. Přizpůsob to tomu, jak se cítíš: v unavené dny se počítá i procházka a krátká odcvičená jednotka má větší cenu než dlouhá vynechaná. Až zapíšeš pár cyklů, objeví se tu návrhy podle fáze.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Krvácení tě stojí železo; červené maso, čočka, cizrna, tmavě zelená listová zelenina a melasa pomáhají ho doplnit. Rostlinné železo se výrazně lépe vstřebává spolu s vitaminem C — vymačkat citron na čočku je nejpraktičtější verze a rajčatový salát vedle udělá totéž. Čaj a káva k jídlu vstřebávání železa kvůli tříslovinám snižují, takže stačí nechat mezi tím zhruba hodinu; ani jednoho se vzdávat nemusíš. Dostatek vody může zmírnit únavu a bolesti hlavy, které krvácení provázejí, a potraviny bohaté na hořčík jako ořechy, semínka a tmavá listová zelenina někomu pomáhají na křeče. Ve dnech, kdy trávení vázne, sednou malá a pravidelná jídla líp než velká. Pokud se kolem menstruace často cítíš zadýchaná, motá se ti hlava nebo jsi nezvykle vyčerpaná, stojí za to to zmínit lékaři — nízké železo je běžné, snadno se vyšetří a není to nic, co má diagnostikovat aplikace.';

  @override
  String get tipNutritionDetailFollicular =>
      'S návratem energie je tělo v režimu obnovy: dost bílkovin, celozrnné potraviny a zelenina to podporují a v téhle fázi bývá chuť k jídlu nejstabilnější a nejlíp zvládnutelná. Dává taky smysl doplňovat zásoby železa i po krvácení, místo aby to byla starost jen týdne menstruace — zásoby se budují týdny, ne dny. Nevynechávat jídla je tady snazší a díky tomu vstoupíš do výkyvů chuti v další fázi vyrovnaněji. Pokud chceš změnit, jak jíš, tenhle úsek bývá k začátku vlídnější než týden před menstruací, kdy chutě a horší nálada dělají z každé nové rutiny něco těžšího, než ve skutečnosti je.';

  @override
  String get tipNutritionDetailFertile =>
      'Tady není potřeba žádná zvláštní strava; vyvážená jídla a dost vody odvedou většinu práce. Někdo se kolem ovulace cítí nafouklý, což bývá hormonální a přechodné, ne důsledek toho, co snědl. Chuť k jídlu u někoho mírně klesne a u někoho stoupne — obojí je běžné. Držet v jídlech bílkoviny a vlákninu stabilizuje energii v tom, co bývá nejrušnější a nejaktivnější částí měsíce. Pokud plánuješ těhotenství, tohle je rozumná chvíle zeptat se lékaře na kyselinu listovou, která se obvykle doporučuje před početím a ne po něm — ale to je rozhovor s ním, ne rada, kterou má dávat aplikace.';

  @override
  String get tipNutritionDetailLuteal =>
      'Zvýšená chuť k jídlu a chuť na sladké, jak stoupá progesteron, jsou hodně běžné; jde o hormonální posun, ne o otázku vůle, a tělo v téhle fázi skutečně spotřebuje o něco víc energie. Přidat do jídel bílkoviny a vlákninu udrží stabilnější cukr v krvi a chuť zmírní mnohem líp než snaha ji ignorovat — chuť, na kterou odpovíš něčím sytým, obvykle skončí dřív než ta, se kterou hodinu bojuješ. Míň soli a víc vody můžou nadýmání ulevit; zní to obráceně, ale není: dobře zavodněné tělo zadržuje míň. Potraviny bohaté na hořčík (mandle, vlašské ořechy, tmavá listová zelenina, hořká čokoláda) u někoho tlumí křeče a napětí. Omezit kofein po poledni pomáhá přerušovanému spánku téhle fáze a hlídat stojí i alkohol, protože rozbíjí spánek přesně v bodě cyklu, kdy je už tak mělčí.';

  @override
  String get tipNutritionDetailUnknown =>
      'Ať jsi v jakékoli fázi, nejvíc pomáhají pořád tytéž věci: pravidelná jídla, dost bílkovin, hodně zeleniny, dost vody a potraviny bohaté na železo. Protože krvácení stojí železo, stačí těm dnům věnovat o něco víc pozornosti — není potřeba jiná strava pro každý týden v měsíci. Jíst zhruba ve stejnou dobu udělá pro vyrovnanou energii víc než jakákoli jednotlivá potravina a nic se nemusí vyškrtávat, aby byl cyklus zdravý. Až zapíšeš pár cyklů, objeví se tu návrhy podle fáze.';

  @override
  String get tipSleepLabel => 'Spánek';

  @override
  String get tipSleepMenstrual =>
      'Křeče a nepohodlí mohou narušit spánek; teplá sprcha nebo ohřívací polštářek před spaním může pomoci.';

  @override
  String get tipSleepFollicular =>
      'S rostoucí energií se mnozí cítí bdělejší — potřeba spánku se ale doopravdy nesnižuje.';

  @override
  String get tipSleepFertile =>
      'Mírné zvýšení tělesné teploty kolem ovulace může trochu ztížit usínání; chladnější pokoj to může vyvážit.';

  @override
  String get tipSleepLuteal =>
      'Progesteron mírně zvyšuje klidovou teplotu a může zlehčit hluboký spánek; chladný, tmavý pokoj a pravidelný čas spánku zde pomáhají nejvíc.';

  @override
  String get tipSleepUnknown =>
      'Kvalita spánku se v průběhu cyklu mění — obvykle nejkřehčí těsně před menstruací a během ní. Pravidelný čas spánku je nejspolehlivějším základem bez ohledu na fázi.';

  @override
  String get tipSleepDetailMenstrual =>
      'Během menstruace bývá spánek roztříštěnější — křeče, nepohodlí a u některých častější chození na toaletu mohou v noci budit. Teplá sprcha, ohřívací polštářek nebo jemné protažení před spaním mohou křeče zmírnit. Pokud užíváš lék proti bolesti, jeho načasování tak, aby účinek pokryl první část noci, může chránit časný spánek. Pokud je spánek stále obtížný, je to normální — obvykle se s fází zlepší.';

  @override
  String get tipSleepDetailFollicular =>
      'S rostoucím estrogenem se mnozí cítí bdělejší a energičtější, což může působit jako menší potřeba spánku. Není to tak úplně přesné — bdělost jen přichází snadněji. Udržení pravidelného času spánku se zde vyplatí později, když je spánek v jiných fázích křehčí. Toto může být také relativně snadné okno na vyzkoušení nové spánkové rutiny.';

  @override
  String get tipSleepDetailFertile =>
      'Mírné zvýšení tělesné teploty kolem ovulace může trochu ztížit usínání, protože tělo se přirozeně chce před spaním ochladit. Chladnější pokoj, lehčí deka nebo teplá sprcha před spaním to mohou vyvážit. Kdo v tomto okně zaznamená vyšší chuť nebo sociální energii, může také zůstat vzhůru déle z vlastní volby — vzorec, který stojí za povšimnutí, ne problém k řešení.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron stoupající po ovulaci mírně zvyšuje klidovou teplotu, což může zlehčit hluboký spánek — někdy jako mírný návaly horka, jindy jen jako méně osvěžující spánek. S blížící se menstruací se k tomu může přidat premenstruační napětí. Chladný, tmavý pokoj, méně obrazovky před spaním a pravidelný čas spánku zde pomáhají nejvíc. Pokud je spánek stále obtížný, není to selhání — je to očekávaná součást fáze.';

  @override
  String get tipSleepDetailUnknown =>
      'Zatím není dost dat k určení fáze, ale kolísání kvality spánku v průběhu cyklu je běžný vzorec — obvykle křehčí těsně před menstruací a během ní, stabilnější v první polovině. Nejspolehlivější základ bez ohledu na fázi: pravidelný čas spánku a probouzení, méně obrazovky před spaním a chladný, tmavý pokoj. Po zaznamenání několika cyklů zde uvidíš konkrétnější vzorce.';
}

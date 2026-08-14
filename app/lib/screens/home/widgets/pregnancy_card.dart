import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/pregnancy_info.dart';

/// Weekly, non-diagnostic notes about a typical pregnancy. Deliberately
/// descriptive ("many people notice…"), never personalized medical advice
/// — CLAUDE.md principle 7 applies here as much as anywhere.
String _weeklyNote(AppLocalizations l10n, int weeks, String lang) {
  final tr = lang == 'tr';
  if (weeks < 5) {
    return tr
        ? 'Bu haftalarda çoğu kişi henüz bir değişiklik hissetmez — gebelik yaşı son adetten sayıldığı için ilk iki hafta aslında gebelik öncesidir.'
        : 'Most people notice nothing yet — because gestational age counts from your last period, the first two weeks are actually before conception.';
  }
  if (weeks < 9) {
    return tr
        ? 'Bulantı, göğüs hassasiyeti ve yorgunluk bu dönemde yaygındır. İlk randevunu planlamak için iyi bir zaman.'
        : 'Nausea, breast tenderness, and fatigue are common right now. A good time to arrange a first appointment.';
  }
  if (weeks < 13) {
    return tr
        ? 'İlk trimesterin sonuna yaklaşıyorsun; birçok kişide bulantı bu haftalarda hafiflemeye başlar.'
        : 'You are nearing the end of the first trimester; for many people nausea starts easing around now.';
  }
  if (weeks < 20) {
    return tr
        ? 'Enerji genelde bu dönemde geri gelir. İlk hareketler 16–22. haftalar arasında hissedilebilir.'
        : 'Energy often returns in this stretch. First movements can be felt anywhere between weeks 16 and 22.';
  }
  if (weeks < 28) {
    return tr
        ? 'Hareketler belirginleşir ve bir örüntü oluşmaya başlar. Sırt ağrısı ve mide yanması bu dönemde sık görülür.'
        : 'Movements get distinct and start forming a pattern. Back pain and heartburn are common in this stretch.';
  }
  if (weeks < 34) {
    return tr
        ? 'Üçüncü trimesterdesin. Nefes darlığı, sık idrara çıkma ve Braxton-Hicks kasılmaları yaygındır.'
        : "You're in the third trimester. Shortness of breath, frequent urination, and Braxton-Hicks contractions are common.";
  }
  if (weeks < 38) {
    return tr
        ? 'Bebek doğuma hazırlanıyor. Doğum çantası ve doğum planı için iyi bir zaman.'
        : 'Baby is getting ready for birth. A good time for a hospital bag and a birth plan.';
  }
  return tr
      ? 'Term dönemindesin — doğum 37. ve 42. haftalar arasında herhangi bir zamanda olabilir; 40. hafta bir son tarih değil, ortalamadır.'
      : "You're at term — birth can happen any time between weeks 37 and 42; week 40 is an average, not a deadline.";
}

/// Replaces the cycle prediction UI on Home while pregnancy mode is on.
class PregnancyCard extends StatelessWidget {
  const PregnancyCard({super.key, required this.info});

  final PregnancyInfo info;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final theme = Theme.of(context);
    final dateFmt = DateFormat.yMMMMd(locale.toString());
    final daysLeft = info.daysUntilDue();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.secondaryContainer.withValues(alpha: 0.7),
            theme.colorScheme.primaryContainer.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.pregnancyWeekLabel(info.weeks, info.daysIntoWeek),
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(l10n.pregnancyTrimesterLabel(info.trimester),
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: info.progress, minHeight: 10),
          ),
          const SizedBox(height: 16),
          Text('${l10n.pregnancyDueDateLabel}: ${dateFmt.format(info.dueDate)}',
              style: theme.textTheme.titleSmall),
          if (daysLeft > 0) ...[
            const SizedBox(height: 4),
            Text(l10n.pregnancyDaysLeft(daysLeft),
                style: theme.textTheme.bodyMedium),
          ],
          const SizedBox(height: 16),
          Text(l10n.pregnancyWeeklyNoteTitle,
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(_weeklyNote(l10n, info.weeks, locale.languageCode),
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          Text(
            l10n.pregnancyDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

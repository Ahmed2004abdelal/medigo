import 'package:flutter/material.dart';
import 'package:medigo/l10n/app_localizations.dart';

String getLocalizedSpecialityTitle(BuildContext context, String key) {
  final l10n = AppLocalizations.of(context)!;
  switch (key) {
    case "Dentist":
      return l10n.dentist;
    case "Ophthalmologist":
      return l10n.ophthalmologist;
    case "ENTSpecialist":
      return l10n.eNTSpecialist;
    case "Otologist":
      return l10n.otologist;
    case "Gynecologist":
      return l10n.gynecologist;
    case "Cardiologist":
      return l10n.cardiologist;
    case "Gastroenterologist":
      return l10n.gastroenterologist;
    case "Neurologist":
      return l10n.neurologist;
    default:
      return key;
  }
}
import 'package:flutter/widgets.dart';
import 'arb/app_localizations.dart';

export 'arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

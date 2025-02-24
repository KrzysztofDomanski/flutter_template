import 'package:flutter/widgets.dart';
import 'package:flutter_template/l10n/arb/app_localizations.dart';

export 'package:flutter_template/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

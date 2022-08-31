import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {
  bool isZh = false;
  DemoLocalizations(this.isZh);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter应用" : "FlutterAPP";
  }
}

//Locale代理类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("$locale");
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == 'zh'));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}

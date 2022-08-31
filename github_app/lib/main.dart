import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_app/common/global.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/routes/home_page.dart';
import 'package:github_app/routes/language_page.dart';
import 'package:github_app/routes/login_page.dart';
import 'package:github_app/routes/theme_page.dart';
import 'package:github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ThemeModel())),
        ChangeNotifierProvider(create: ((context) => UserModel())),
        ChangeNotifierProvider(create: ((context) => LocaleModel())),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localeModel, child) {
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme,
              ),
              locale: localeModel.getLocale(),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              onGenerateTitle: (context) => S.of(context).title,
              localeResolutionCallback: (_locale, supportedLocales) {
                if (localeModel.getLocale() != null) {
                  return localeModel.getLocale();
                } else {
                  Locale locale;
                  if (supportedLocales.contains(_locale)) {
                    locale = _locale!;
                  } else {
                    locale = const Locale('en');
                  }
                  return locale;
                }
              },
              initialRoute: "/",
              routes: {
                "/": (context) => const HomePage(),
                "login": (context) => const LoginPage(),
                "theme": (context) => const ThemePage(),
                "language": (context) => const LanguagePage(),
              });
        },
      ),
    );
  }
}

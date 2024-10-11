
import 'package:cihapp/flutter_gen/gen_l10n/app_localizations_ar.dart';
import 'package:cihapp/presentaiton/Conf/Provider/Provider.dart';
import 'package:cihapp/presentaiton/Conf/Theme/ThemeProvider.dart';
import 'package:cihapp/presentaiton/homePage/HomePage.dart';
import 'package:cihapp/splash/Signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:cihapp/flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    localeProvider.setScreenSize(context);

    return MaterialApp(
      theme: themeProvider.themdata,
      locale: localeProvider.locale,
      color: Colors.white,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      //
      // supportedLocales: AppLocalizations.supportedLocales,
      home: Homepage(),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:form_builder_validators/localization/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medico/config/app_config.dart' as config;
import 'package:flutter/material.dart';
import 'package:medico/routes_generator.dart';

// void main() => runApp(MyApp()); // Original Code

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  try {
    cameras = await availableCameras();

  } on CameraException catch (e) {
    print(e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return MaterialApp(
      title: 'Ecommerce Flutter UI',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFF252525),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        accentColor: config.Colors().mainDarkColor(1),
        hintColor: config.Colors().secondDarkColor(1),
        focusColor: config.Colors().accentDarkColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Color(0xFF252525)),
          headline1: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
          headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          headline4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1)),
          headline5: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1)),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1)),
          subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1)),
          bodyText1: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
          // CUSTOM STYLES CREATED
          // END OF CUSTOM STYLE
          // headline: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
          // display1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          // display2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          // display3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1)),
          // display4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1)),
          // subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1)),
          // title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1)),
          // body1: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
          // body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          // caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        brightness: Brightness.light,
        accentColor: config.Colors().mainColor(1),
        focusColor: config.Colors().accentColor(1),
        hintColor: config.Colors().secondColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Theme.of(context).primaryColor),
          headline1: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
          headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          headline4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1)),
          headline5: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1)),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1)),
          subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1)),
          bodyText1: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
          caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
          // headline: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
          // display1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
          // display2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
          // display3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainColor(1)),
          // display4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondColor(1)),
          // subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondColor(1)),
          // title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainColor(1)),
          // body1: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1)),
          // body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
          // caption: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(0.6)),
        ),
      ),
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
        Locale('fa', ''),
        Locale('fr', ''),
        Locale('ja', ''),
        Locale('pt', ''),
        Locale('sk', ''),
        Locale('pl', ''),
      ],
    );
  }
}

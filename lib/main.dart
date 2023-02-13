
import 'dart:io';

import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/apis/secret.dart';
import 'package:SmileApp/firebase_options.dart';
import 'package:SmileApp/routes_generator.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:SmileApp/config/app_config.dart' as config;
import 'package:sizer/sizer.dart';



 List<CameraDescription> cameras = [];

Future<void> main() async {  // The code before I added Flutter_redux
  WidgetsFlutterBinding.ensureInitialized();
 await init();

  cameras = await availableCameras();
  //runApp(MyApp());

  bool? loginStatus = await Localstorage().getBoolean(key_login_status);

  ((){
    if(loginStatus != null){
     // Future.delayed(const Duration(milliseconds: 100)); //TODO: ADDED THIS AS A HACK TO SOLVE THE Rating PageView Issue (Original)
      if (loginStatus == true){
        ApiAccess().refreshData();
        runApp(MyApp(landingURL: '/home_with_alert',));
      }else{
        runApp(MyApp(landingURL: '/',));
      }
    }else{
      runApp(MyApp(landingURL: '/',));
    }
  }());

}


Future init() async{

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: ApiKey,
          appId: AppId,
          messagingSenderId: MessagingSenderID,
          projectId: ProjectID,
        )).then((value) => {
      FirebaseMessaging
          .instance // This is to enable the notification run while app is in terminated mode
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {}
      }),

    });
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }

  await WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {

  String landingURL;
  MyApp({required String this.landingURL });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return  MaterialApp(
          title: 'Smile App',
          // initialRoute: '/',
          initialRoute: landingURL,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green, // Just Added
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
              ),
              dialogTheme: DialogTheme(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              )
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
      },
    );

     return  MaterialApp(
        title: 'Smile App',
       // initialRoute: '/',
        initialRoute: landingURL,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green, // Just Added
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
          ),
          dialogTheme: DialogTheme(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          )
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

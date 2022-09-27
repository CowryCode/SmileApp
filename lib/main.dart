
import 'dart:io';

import 'package:SmileApp/apis/secret.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/timerdatamodel.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:SmileApp/pages/custompages/statemanagement/sg_message_reducer.dart';
import 'package:SmileApp/routes_generator.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:form_builder_validators/localization/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:SmileApp/config/app_config.dart' as config;

import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'apis/models/countrymodel.dart';


// void main() => runApp(MyApp()); // Original Code

// class MyApp extends StatelessWidget {
//   final Store<AppState> _store = Store<AppState>(
//     updateDrinksReducer,
//     initialState: AppState(drinks:[
//       Drink("Water", true),
//       Drink("Coka Cola", false),
//       Drink("Juice", true),
//       Drink("Alcohol", false)
//      ]
//     )
//   );
//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider(
//         store: _store,
//       child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Redux solution - Flutter Explained',
//       theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
//       home: ReduxScreen(),
//     )
//     );
//   }
// }


// ORIGINAL CODE START HERE, PLEASE REVERT TO IT AFTER ADDING FLUTTER_REDUX

 List<CameraDescription> cameras = [];

Future<void> main() async {  // The code before I added Flutter_redux
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print("Threw error");
    print(e.toString());
  }
  runApp(MyApp());
}


Future init() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isIOS){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: ApiKey,
          appId: AppId,
          messagingSenderId: MessagingSenderID,
          projectId: ProjectID
      )).then((value) => {
       // FirebaseMessaging
       //     .instance
       //     .getInitialMessage()
       //     .then((RemoteMessage message) {
       //   if (message != null) {
       //     // Do Nothing
       //   }
       // }),
    });
  }else{
    await Firebase.initializeApp();
  }
  // FirebaseMessaging.instance.getToken().then((value) => {
  //   print("FB TOken is : $value");
  // });
}

class MyApp extends StatelessWidget {

  final Store<MyAppState> _store = Store<MyAppState>(
      updateSGmessageReducer,
      initialState: MyAppState(
        sg_message: SGMessage(content: "", updated: false),
        luckPotTimerstatemodel: LuckPotTimerstatemodel(activate: false)
      )
  );

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);

    return StoreProvider<MyAppState>(
      store: _store,
      child: MaterialApp(
        title: 'Smile App',
        initialRoute: '/',
        //initialRoute: '/home_with_alert',
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
      ),
    );
  }
 }

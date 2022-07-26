
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:form_builder_validators/localization/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medico/config/app_config.dart' as config;
import 'package:medico/pages/custompages/redux/app_state.dart';
import 'package:medico/pages/custompages/redux/models/drink.dart';
import 'package:medico/pages/custompages/redux/reducer.dart';
import 'package:medico/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:medico/pages/custompages/statemanagement/my_app_state.dart';
import 'package:medico/pages/custompages/statemanagement/sg_message_reducer.dart';
import 'package:medico/routes_generator.dart';

import 'package:redux/redux.dart';


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
  print("It got here 1,2,3 ");

  try {
    cameras = await availableCameras();
    print("It got here 4,5,6");
  } on CameraException catch (e) {
    print("Threw error");
    print(e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final Store<AppState> _store = Store<AppState>(
  //     updateDrinksReducer,
  //     initialState: AppState(drinks:[
  //       Drink("Water", true),
  //       Drink("Coka Cola", false),
  //       Drink("Juice", true),
  //       Drink("Alcohol", false)
  //     ]
  //     )
  // );
  final Store<MyAppState> _store = Store<MyAppState>(
      updateSGmessageReducer,
      initialState: MyAppState(
        sg_message: SGMessage(content: "", updated: false),)
  );
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);

    return StoreProvider<MyAppState>(
      store: _store,
      child: MaterialApp(
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

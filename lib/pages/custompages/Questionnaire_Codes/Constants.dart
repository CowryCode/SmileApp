import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';



String meriendaOneFont = "MeriendaOne";
String bebasneue = "Bebasneue";


class Constants {
  static String assetsImagePath = "assets/images/";
  static String assetsbackgroundImagePath = "assets/images/box/";
  static String assetsGifPath = "assets/gifs/";
  static String assetsImageFormat = ".gif";
  static String fontsFamily = 'OpenSans';
  static String boldFontsFamily = 'SecularOne';
  static String videoURL = 'https://www.youtube.com/watch?v=ml6cT4AZdqI';
  static int levelBeginner = 1;
  static int levelIntermediate = 2;
  static int levelAdvanced = 3;
  static const int workoutId = 1;
  static const int discoverId = 2;
  static const int quickWorkoutId = 3;
  static const int stretchesId = 4;
  static const double calDefaultCalculation = 0.002;
  static const double METDefaultCalculation = 7.7;
  static const int defaultdDBWDivider = 200;
  static const double weightDefaultCalculation = 2.2;
  static const double calDuration = 0.01666667;
  static const double danceMET = 4.0;
  static final calFormatter = new NumberFormat("#.##");
  static final String defTimeZoneName ="America/Detroit";

  static DateFormat addDateFormat = DateFormat("dd-MM-yyyy", "en-US");
  static DateFormat timeFormats = DateFormat("mm:ss", "en-US");
  static DateFormat historyTitleDateFormat =
      DateFormat("MMMM dd, yyyy", "en-US");
  static final formatter = new NumberFormat("#.##");
  // static final formatter = new NumberFormat(",##");
  static int minTime=0;
  static int maxTime=4;


  static double feetAndInchToCm(double feet, double inch) {
    double meter;
    double f1 = (feet / 3.281);
    double i1 = (inch / 39.37);
    meter = f1 + i1;
    return meter*100;
  }

  static void meterToInchAndFeet(double cm, TextEditingController ftController,
      TextEditingController inchController) {
    double meter = cm / 100;
    double inch = (meter * 39.37);
    double ft1 = inch / 12;
    int n = ft1.toInt();
    double in1 = ft1 - n;
    double in2;
    in2 = in1 * 12;
    ftController.text = n.round().toString();
    inchController.text = in2.round().toString();
  }
  static String meterToInchAndFeetText(double cm) {
    double meter = cm / 100;
    double inch = (meter * 39.37);
    double ft1 = inch / 12;
    int n = ft1.toInt();
    double in1 = ft1 - n;
    double in2;
    in2 = in1 * 12;
    return n.round().toString()+" ft "+in2.round().toString()+" in";
    // ftController.text = n.round().toString();
    // inchController.text = in2.round().toString();
  }


  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

static  double getWidthPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width * percent) / 100;
  }
  static double getPercentSize(double total, double percent) {
    return (total * percent) / 100;
  }

  static double kgToPound(double kg) {
    return kg * 2.205;
    // return (total * percent) / 100;
  }

  static double poundToKg(double kg) {
    return kg / 2.205;
    // return (total * percent) / 100;
  }

  static String getTableNames(int ids) {
    String string = "tbl_workout_exercise_list";
    switch (ids) {
      case workoutId:
        string = "tbl_workout_exercise_list";
        break;
      case discoverId:
        string = "tbl_discover_exercise_list";
        break;
      case quickWorkoutId:
        string = "tbl_quickworkout_exercise_list";
        break;
      case stretchesId:
        string = "tbl_stretches_exercise_list";
        break;
    }
    return string;
  }

  static Color getColorFromHex(String colors) {
    var color = "0xFF$colors";
    try {
      return Color(int.parse(color));
    } catch (e) {
      print(e);
      return Color(0xFFFFFFFF);
    }
  }

  // String format() => '$this'.split('.')[0].padLeft(8, '0');
  // String time = Duration(seconds: 3661).format(); // 01:01:01
  static format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  static formatMinutes(Duration d) => d.toString().substring(2,7);

  static String getTimeFromSec(int sec) {
    print("getsec===$sec");
    // final d1 = Duration(milliseconds:  sec);
    final d1 = Duration(seconds: sec);
    return format(d1);
  }
  static String getMMSSFromSec(int sec) {
    print("getsec===$sec");
    // final d1 = Duration(milliseconds:  sec);
    final d1 = Duration(seconds: sec);
    return formatMinutes(d1);
  }


  static showToast(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
  // Custom Toast Position
}

  //
  // static String getMinuteFromSec(int seconds) {
  //   int minutes = (seconds / 60).truncate();
  //   String minutesStr = (minutes % 60).toString().padLeft(2, '0');
  //   if(minutes>0)
  //     {
  //       return "$minutesStr Minutes";
  //     }
  //   else{
  //     return "$seconds Seconds";
  //   }
  // }

  static String getAppLink() {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String pkgName = "loseweight.home.ui";
    String appStoreIdentifier = "1562289688";
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=$pkgName";
      // Android-specific code/UI Component
    } else if (Platform.isIOS) {
      return "https://apps.apple.com/us/app/apple-store/id$appStoreIdentifier";
      // iOS-specific code/UI Component
    }
    return "";
  }


  static Color darken(Color c, [int percent = 30]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  static Color brighten(Color c, [int percent = 15]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
  }
}

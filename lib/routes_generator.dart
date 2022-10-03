import 'package:SmileApp/models/mymodels/smilemodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/smilegramLogin.dart';
import 'package:SmileApp/pages/custompages/tribes/tribe_page.dart';
import 'package:flutter/material.dart';
import 'package:SmileApp/pages/custompages/emotions.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_view.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_view_gift.dart';
import 'package:SmileApp/pages/custompages/leaderboard/smileleader.dart';
import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:SmileApp/pages/custompages/patient/completeprofile.dart';
import 'package:SmileApp/pages/custompages/tribe_messages.dart';
import 'package:SmileApp/pages/custompages/chat.dart';




class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch(settings.name){
        // MY CUSTOM ROUTE START
    // SMILE APP
      case '/' :
        return MaterialPageRoute(builder: (_) => SmilegramLogin());
      case '/home_with_alert' :
      //  return MaterialPageRoute(builder: (_) => Home());
        return MaterialPageRoute(builder: (_) => NavigateTabsWidget(showEmotionalert: true,));
      case '/home' :
        return MaterialPageRoute(builder: (_) => NavigateTabsWidget(showEmotionalert: false,));
      // case '/mydoctors':
      //   return MaterialPageRoute(builder: (_) => MyDoctorsList());
      case '/chat' :
        return MaterialPageRoute(builder: (_) => ChatWidget());
      case '/emotions':
        return MaterialPageRoute(builder: (_) => Emotions());
      case '/smilegram':
        return MaterialPageRoute(builder: (_) => FaceDetectorView());
      case '/smilegramgift':
        return MaterialPageRoute(builder: (_) => FaceDetectorGiftView(giftVariableObject: args as GiftVariableObject,));
      case '/leaderboard':
        return MaterialPageRoute(builder: (_) => LeadderBoard());
      case '/tribemessages':
        return MaterialPageRoute(builder: (_) => TribeMessageList());
      case '/tribeunreadmessages':
        return MaterialPageRoute(builder: (_) => TribePage());
    // SMILE APP

      case '/completeprofile':
        return MaterialPageRoute(builder: (_) => CompleteProfile());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }
    static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
import 'package:SmileApp/models/mymodels/smilemodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/tribes/tribe_page.dart';
import 'package:flutter/material.dart';
import 'package:SmileApp/pages/appointment.dart';
import 'package:SmileApp/pages/book-test-online1.dart';
import 'package:SmileApp/pages/book-test-online2.dart';
import 'package:SmileApp/pages/book-test-online3.dart';
import 'package:SmileApp/pages/book-test-online4.dart';
import 'package:SmileApp/pages/custompages/animation_views/countdown_widget.dart';
import 'package:SmileApp/pages/custompages/emotions.dart';
import 'package:SmileApp/pages/custompages/facetracker/SmileTracker.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_view.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_view_gift.dart';
import 'package:SmileApp/pages/custompages/home.dart';
import 'package:SmileApp/pages/custompages/leaderboard/smileleader.dart';
import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:SmileApp/pages/custompages/patient/completeprofile.dart';
import 'package:SmileApp/pages/custompages/patient/hospitaldetail.dart';
import 'package:SmileApp/pages/custompages/patient/hospitals.dart';
import 'package:SmileApp/pages/custompages/patient/voicecall.dart';
import 'package:SmileApp/pages/custompages/patient/services.dart';
import 'package:SmileApp/pages/custompages/pending_task_tribe.dart';
import 'package:SmileApp/pages/custompages/provider/my-patients.dart';
import 'package:SmileApp/pages/custompages/provider/patientencounterprofile.dart';
import 'package:SmileApp/pages/custompages/provider/patientsqueue.dart';
import 'package:SmileApp/pages/custompages/provider/providerhome.dart';
import 'package:SmileApp/pages/custompages/provider/providertabs.dart';
import 'package:SmileApp/pages/custompages/redux/redux_screen.dart';
import 'package:SmileApp/pages/custompages/tribe_messages.dart';
import 'package:SmileApp/pages/doctor-book-1.dart';
import 'package:SmileApp/pages/doctor-book-2.dart';
import 'package:SmileApp/pages/health.dart';
import 'package:SmileApp/pages/medeciens-2.dart';
import 'package:SmileApp/pages/medecines.dart';
import 'package:SmileApp/pages/my-doctors.dart';
import 'package:SmileApp/pages/offers.dart';
import 'package:SmileApp/pages/Welcome.dart';
import 'package:SmileApp/pages/custompages/chat.dart';
import 'package:SmileApp/pages/createAccount.dart';
import 'package:SmileApp/pages/docotr_acount.dart';
import 'package:SmileApp/pages/doctors.dart';

import 'package:SmileApp/pages/phoneNumber_login.dart';
import 'package:SmileApp/pages/signup.dart';
import 'package:SmileApp/pages/tabs.dart';
import 'package:SmileApp/pages/verification_number.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch(settings.name){
      // case '/' :
      //   return MaterialPageRoute(builder: (_) => Welcome());
      // case '/' :
      //   return MaterialPageRoute(builder: (_) => Home()); // ReduxScreen());
      case '/signup' :
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/phone':
        return MaterialPageRoute(builder: (_) => PhoneLogin());
      // case '/verification':
      //   return MaterialPageRoute(builder: (_) => VerificationNumber(data: args));
      // case '/createAcount':
      //   return MaterialPageRoute(builder: (_) => CreateAcount());
      // case '/doctors':
      //   return MaterialPageRoute(builder: (_) => DoctorsList());
      // case '/doctorProfil':
      //   return MaterialPageRoute(builder: (_) => DoctorAcount());
      // case '/firstDoctorBook':
      //   return MaterialPageRoute(builder: (_) => DoctorBookFirstStep());
      // case '/secondeDoctorBook':
      //   return MaterialPageRoute(builder: (_) => DoctorBookSecondeStep());
      // case '/offers':
      //   return MaterialPageRoute(builder: (_) => OffersList());
      // case '/bookTest':
      //   return MaterialPageRoute(builder: (_) => BookTestsOnline());
      // case '/secondeBookTest':
      //   return MaterialPageRoute(builder: (_) => BookTestsOnlineSecondeStep());
      // case '/thirdBookTest':
      //   return MaterialPageRoute(builder: (_) => BookTestsOnlineThirdStep());
      // case "/fourthBookTest":
      //   return MaterialPageRoute(builder: (_) => BookTestsOnlineFourthStep());
      // case '/medecines':
      //   return MaterialPageRoute(builder: (_) => Medecines());
      // case '/medecinesSeconde':
      //   return MaterialPageRoute(builder: (_) => MedecinesSlected());
      // case '/appointment':
      //   return MaterialPageRoute(builder: (_) => AppointmentsList());
      case '/health':
        return MaterialPageRoute(builder: (_) => HealthTips());



        // MY CUSTOM ROUTE START
    // SMILE APP
      case '/' :
      //  return MaterialPageRoute(builder: (_) => Home());
        return MaterialPageRoute(builder: (_) => NavigateTabsWidget(showEmotionalert: true,));
      case '/home' :
        return MaterialPageRoute(builder: (_) => NavigateTabsWidget(showEmotionalert: false,));
      case '/mydoctors':
        return MaterialPageRoute(builder: (_) => MyDoctorsList());
      case '/chat' :
        return MaterialPageRoute(builder: (_) => ChatWidget());
      case '/emotions':
        return MaterialPageRoute(builder: (_) => Emotions());
      case '/smilegram':
        return MaterialPageRoute(builder: (_) => FaceDetectorView());
       // return MaterialPageRoute(builder: (_) => SmileHome());
      case '/smilegramgift':
       // return MaterialPageRoute(builder: (_) => FaceDetectorGiftView());
        return MaterialPageRoute(builder: (_) => FaceDetectorGiftView(giftVariableObject: args as GiftVariableObject,));
      case '/leaderboard':
        return MaterialPageRoute(builder: (_) => LeadderBoard());
      case '/tribemessages':
        return MaterialPageRoute(builder: (_) => TribeMessageList());
      case '/tribependingtasks':
        return MaterialPageRoute(builder: (_) => TribePendingTaskList());
      case '/tribeunreadmessages':
        return MaterialPageRoute(builder: (_) => TribePage());
    // SMILE APP



       // PATIENT
      // case '/voicecall' :
      //   return MaterialPageRoute(builder: (_) => VioceCallWidget());
      // case '/hospitals' :
      //   return MaterialPageRoute(builder: (_) => HospitalsList());
      // case '/hospitaldetail' :
      //   return MaterialPageRoute(builder: (_) => HospitalDetail());
      // case '/services':
      //   return MaterialPageRoute(builder: (_) => ServicesList());
      case '/completeprofile':
        return MaterialPageRoute(builder: (_) => CompleteProfile());
        // PROVIDER
      // case '/providerhome':
      //   return MaterialPageRoute(builder: (_) =>  ProviderTabsWidget(acountInfos: args,));
      // case '/mypatients':
      //   return MaterialPageRoute(builder: (_) =>  MyPatientsList());
      // case '/patientencounterprofile':
      //   return MaterialPageRoute(builder: (_) =>  PatientEncounterProfile());
      // case '/patientqueuelist':
      //   return MaterialPageRoute(builder: (_) => PatientQueueList());
    // END OF MY CUSTOME ROUTE

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
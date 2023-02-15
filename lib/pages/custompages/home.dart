import 'dart:async';

import 'dart:math';
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/config/custom_design.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/notification/notification.dart';
import 'package:SmileApp/pages/custompages/Questionnaire_Codes/MoodScale.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/SmileGram_Achievement_Alert.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:SmileApp/pages/custompages/setting.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/apis/Utilities.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  final String? value;

  // const Home( {Key key, this.value}) : super(key: key);
  final bool checkEmotion;

  const Home({Key? key, this.value, required this.checkEmotion})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    // if(userProfileNotifier.value.name == null ){
    //
    // }
    // TRAP NOTIFICATIONS
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool result = await InternetConnectionChecker().hasConnection;

      if (result == true) {
        if (widget.checkEmotion == true) {
         // _openRatingDialog(ratingOnly: true);
          MoodModel mood = MoodModel();
          mood.initializeMood(rating: 0);
          smileAppValueNotifier.initializeMoodNotifier(mood: mood);
        }else{
          ApiAccess().refreshData();
        }
        await Firebase.initializeApp();
        await FirebaseMessaging.instance.getToken().then((token) {
          ApiAccess().uploadDeviceIdentifier(deviceID: token!);
        });
      } else {
        _showNetworkAlert(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_)=> {
    // if(ApiAccess().hasPayLoad() == false) {
    //     _showNetworkAlert(context: context,
    //     message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
    //      }
    //  });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // body: SingleChildScrollView(

        body:  SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 15.h,
                                padding:
                                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                  // color: Theme.of(context).accentColor,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '${Utilities().AppName}',
                                          style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder(
                                                valueListenable: userProfileNotifier,
                                                builder:
                                                    (context, UserProfile userfile, child) {
                                                  return Text(
                                                    (userfile.name != null)
                                                        ? "${userfile.name}"
                                                        : "",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16.0.sp,
                                                      color: Theme.of(context).primaryColor,
                                                    ),
                                                  );
                                                }),
                                            IconButton(
                                              onPressed: () {
                                                (ApiAccess().hasPayLoad() == false) ?
                                                _showNetworkAlert(context: context)
                                                    :
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Setting()));
                                              },
                                              icon: Icon(Icons.settings),
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 80.0),
                              //   padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                              // ),
                            ],
                          ),
                          //SMILE GRAM
                          TextButton(
                            onPressed: () {
                              (ApiAccess().hasPayLoad() == false) ?
                              _showNetworkAlert(context: context)
                              :
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('SmileGram', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                                  content: SingleChildScrollView(
                                    child: Container(
                                      height: 90.h,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                        Text(
                                            "Paint the world with your smile.",
                                           // style: TextStyle(color: Colors.black),
                                            style: CustomeStyling().customContenttextBlack(opecity: 1),
                                        ),
                                        Text(
                                                "How to play: ",
                                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                          ),
                                         Text(
                                                  "You will see two icons after the countdown. Maintain a smile until both icons overlap. When you stop smiling, the 'moving' icon stops "
                                                  "moving. Stop smiling at the point the two icons overlap, this will gain you a point and a country in the underlying map"
                                                  " will be painted green. \n"
                                                  "Repeat this until the entire world map is painted green. \n\n"
                                                  "Do you want to continue?",
                                             // style: TextStyle(color: Colors.black),
                                            style: CustomeStyling().customContenttextBlack(opecity: 1),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      //  onPressed: () => Navigator.pop(context, 'Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel', ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        smileAppValueNotifier.updateShowCountDown(
                                            showCoundown: true);
                                        GiftVariableObject variables =
                                            new GiftVariableObject(readmessage: false);
                                        Navigator.of(context).popAndPushNamed(
                                            '/smilegramgift',
                                            arguments: variables);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                               // height: 150.0,
                              width: MediaQuery.of(context).size.width * 0.90.w,
                             // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(
                                    width: 1.0.w, color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0.sp),
                                    child: Icon(
                                      FontAwesomeIcons.faceSmileBeam,
                                      color: Theme.of(context).primaryColor,
                                      size: 30.sp,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("SmileGram",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColor),
                                          textAlign: TextAlign.center),
                                      Text(
                                        "Your Smile is Powerful, "
                                        "Play the \n Smile Game! ",
                                        style: CustomeStyling().customContenttextWhite(opecity: 1),
                                        // style: Theme.of(context).textTheme.bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          const Icon(
                                            FontAwesomeIcons.solidCircle,
                                          //  color: Colors.white,
                                            color: Colors.green,
                                            size: 12,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: ValueListenableBuilder(
                                                valueListenable: smileGameNofitier,
                                                builder: (context, SmileGameVariables value, child) {
                                                  return Text(
                                                    (value.getSmileNumberofCountriesPainted() == null)
                                                        ? " "
                                                        : " Score : ${value.getSmileNumberofCountriesPainted()} / 175 ",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context).primaryColor,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14.0.sp,
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FontAwesomeIcons.angleRight,
                                    color: Theme.of(context).primaryColor,
                                    size: 30.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //POCKET BUDDY
                          TextButton(
                            onPressed: () {
                              (ApiAccess().hasPayLoad() == false) ?
                              _showNetworkAlert(context: context)
                                  :
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Pocket Buddy', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                  content: Text(
                                    'The conversational AI bot keeps you company by holding a conversation with you. You can ask her anything in any field.'
                                        'The bot can compose music, poem, etc. Spend some time with the bot and enjoy the functionality. \n\n'
                                        'Do you want to continue ?',
                                    style: CustomeStyling().customContenttextBlack(opecity: 1),
                                    //  style: TextStyle(color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(context, '/chat');
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                             // height: 120.0,
                              width: MediaQuery.of(context).size.width * 0.90.w,
                             // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                border: Border.all(
                                    width: 1.0.w, color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.0.sp),
                                      child: Icon(
                                        FontAwesomeIcons.message,
                                        color: Theme.of(context).primaryColor,
                                        size: 30.sp,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Pocket Buddy",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor),
                                            textAlign: TextAlign.center),
                                        Wrap(
                                          children: [
                                            Text(
                                                "Chat with ",
                                                style: CustomeStyling().customContenttextWhite(opecity: 1),
                                                // style: Theme.of(context).textTheme.bodyMedium,
                                                textAlign: TextAlign.center),
                                            Text(
                                                "Adaeze, ",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:  Colors.orange,
                                                ),
                                                textAlign: TextAlign.center),
                                            Text("our AI bot.",
                                                style: CustomeStyling().customContenttextWhite(opecity: 1),
                                                // style: Theme.of(context).textTheme.bodyMedium,
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        Text("She is always willing to chat.",
                                            style: CustomeStyling().customContenttextWhite(opecity: 1),
                                            // style: Theme.of(context).textTheme.bodyMedium,
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: Theme.of(context).primaryColor,
                                      size: 30,
                                    ),
                                  ],
                              ),
                            ),
                          ),
                          //TRIBE MESSAGES
                          TextButton(
                            onPressed: () {
                              (ApiAccess().hasPayLoad() == false) ?
                              _showNetworkAlert(context: context)
                                  :
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('My Tribe', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                  content: Text(
                                    "There are many anonymous users willing to support with encouraging words. When you don't feel strong, you can anonymously "
                                        "inform the community members by clicking on the floating button and select the emotion(s) that reflects how you feel. \n\n"
                                        "Do you want to continue ?",
                                    style: CustomeStyling().customContenttextBlack(opecity: 1),
                                    //style: TextStyle(color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(context, '/tribemessages');
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                             // height: 120.0,
                              width: MediaQuery.of(context).size.width * 0.90.h,
                              margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                //  color: Theme.of(context).colorScheme.secondary,
                                border: Border.all(
                                    width: 1.0.w, color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // SizedBox(
                                  //   width: 2.0,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Icon(
                                      FontAwesomeIcons.peopleGroup,
                                      color: Theme.of(context).primaryColor,
                                      size: 30,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "My Tribe",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        width: 60.w,
                                        child: Text(
                                            "Get encouraging words from anonymous community.",
                                            style: CustomeStyling().customContenttextWhite(opecity: 1),
                                           // style: Theme.of(context).textTheme.bodyMedium,
                                            textAlign: TextAlign.center
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FontAwesomeIcons.angleRight,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: tribeMessagesNotifier,
                              builder: (context, List<TribeMessage> value, child) {
                                return Text(
                                  '${value.length} Unread Message(s)',
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.secondary),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: tribeMessagesNotifier,
                              builder: (context, List<TribeMessage> value, child) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    //  children: getSmilePacks(tribeMessagesNotifier.value),
                                    children: getSmilePacks(value),
                                  ),
                                );
                              }),

                        ],
                    ),
            ),
          ),
              ),
          //  ),
       // ),
    );
  }

  List<Widget> getSmilePacks(List<TribeMessage> msgs) {
    List<Widget> cards = [];
    for (int x = 0; x < msgs.length; x++) {
      cards.add(card(
          image: "images/asset-1.png",
          message: "${msgs[x].content}",
          msgid: msgs[x].id!,
          location: msgs[x].sourceCountry!));
    }
    return cards;
  }

  Widget _ball(String image, Color color) {
    return Container(
      height: 80,
      width: 80.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _ballcard(String image, Color color) {
    return Container(
      height: 60,
      width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget card(
      {required String image,
      required String message,
      required int msgid,
      required String location}) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _showAlert(context: context, message: message, msgID: msgid);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            width: 80.0.sp,
           // width: 140.0,
            //height: 110.0,
            child: Card(
              elevation: 0.2,
              //margin: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 1.0, left: 2.0 ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.email_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        "From : \n $location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10.0,
                          color: Colors.black45,
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  RatingDialog _showRatingAlert(BuildContext context) {
    return RatingDialog(
      showCloseButton: false,
      starSize: 30.0,
      initialRating: 0.0,
      // your app's name?
      title: Text(
        'Rate Your Mood',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        'How happy do you feel now?',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(
        "assets/logo1.png",
        width: 100,
        height: 100,
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        Navigator.of(context).popAndPushNamed(
          '/home',
        );
        print('rating: , comment: ${response.comment}');
        MoodModel mood = MoodModel();
        mood.initializeMood(rating: response.rating.round());
        smileAppValueNotifier.initializeMoodNotifier(mood: mood);
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.green),
    );
  }

  _showAlert(
      {required BuildContext context,
      required String message,
      required int msgID}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('My Tribe'),
        content: const Text(
          'To unlock this message, you need to maintain a smile as the message unfolds',
          style: TextStyle(color: Colors.black45),
        ),
        actions: <Widget>[
          TextButton(
            //  onPressed: () => Navigator.pop(context, 'Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () {
              messageNotifier.update(message: "", index: 0);
              smileAppValueNotifier.updateShowCountDown(showCoundown: true);
              Navigator.of(context).popAndPushNamed('/smilegramgift',
                  arguments: new GiftVariableObject(
                      id: msgID, msg: message, readmessage: true));
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  _openRatingDialog({required bool ratingOnly}) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: RatingView(
                msg: "Select any emotion that best describes your feeling now",
                ratingonly: ratingOnly,
                onExit: (response) {
                  Navigator.of(context).popAndPushNamed(
                    '/home',
                  );

                  MoodModel mood = MoodModel();
                  mood.initializeMood(rating: response.userrating.round());
                  smileAppValueNotifier.initializeMoodNotifier(mood: mood);
                },
                onContinue: () {},
              ),
            ));
  }

  _showNetworkAlert({required BuildContext context}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
              size: 20.sp,
            )),
        content: Text(
          "It seems your device is not connected to the internet, Kindly check.",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black45,
            fontFamily: 'Poppins',
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          // TextButton( onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK'),),
          TextButton(
            onPressed: () {
             // ApiAccess().Logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigateTabsWidget(showEmotionalert: false,)));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _showBMIkAlert({required BuildContext context}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: Text(
              'Daily Questionnaire',
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
                fontFamily: 'Poppins',
                fontSize: 20.0.sp,
              ),
              textAlign: TextAlign.center,
            )),
        content: Text(
          "We noticed that you are yet to complete today's questionnaire. \n \n Completing this questionnaire will help us improve the app. \n \n Will you want to complete it now?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black45,
            fontFamily: 'Poppins',
            fontSize: 12.0.sp,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No', style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                ),),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MoodScale()));
                },
                child: Text('Yes', style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }



}

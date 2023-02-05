import 'dart:async';
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/notification/notification.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/SmileGram_Achievement_Alert.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/smile_game2_view.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/smile_game3_view.dart';
import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:SmileApp/pages/custompages/setting.dart';
import 'package:SmileApp/pages/login/login.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/apis/Utilities.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rating_dialog/rating_dialog.dart';

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
    // bool result = await InternetConnectionChecker().hasConnection;

   // if (widget.checkEmotion == false) ApiAccess().refreshData();

    if(userProfileNotifier.value.name == null ){

    }
    // TRAP NOTIFICATIONS
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool result = await InternetConnectionChecker().hasConnection;

      if (result == true) {
        if (widget.checkEmotion == true) {
          _openRatingDialog(ratingOnly: true);
        }else{
          ApiAccess().refreshData();
        }
        await Firebase.initializeApp();
        await FirebaseMessaging.instance.getToken().then((token) {
          ApiAccess().uploadDeviceIdentifier(deviceID: token!);
        });
      } else {
        _showNetworkAlert(
            context: context,
            message: "It seems your device is not connected to \n the internet. Kindly check and login again.");
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 80,
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
                                fontSize: 22.0,
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
                                          fontSize: 16.0,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      );
                                    }),
                                IconButton(
                                  onPressed: () {
                                    (ApiAccess().hasPayLoad() == false) ?
                                    _showNetworkAlert(context: context, message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
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
                  Container(
                    margin: const EdgeInsets.only(top: 80.0),
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  ),
                ],
              ),
              SizedBox(
                height: 1,
              ),
              //SMILE GRAM
              TextButton(
                onPressed: () {
                  (ApiAccess().hasPayLoad() == false) ?
                  _showNetworkAlert(context: context, message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
                  :
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('SmileGram'),
                      content: const Text(
                        'To play the SmileGram, when the counter finishes. \n Maintain a smile until the big and small stars meet. ',
                        style: TextStyle(color: Colors.black),
                      ),
                      actions: <Widget>[
                        TextButton(
                          //  onPressed: () => Navigator.pop(context, 'Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
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
                          child: const Text('Continue'),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  //  height: 120.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                        width: 1.0, color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(
                        FontAwesomeIcons.faceSmileBeam,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("SmileGram",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                              textAlign: TextAlign.center),
                          Text(
                            "Your Smile is Powerful, \n"
                            "Play the Smile Game! ",
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.solidCircle,
                              //  color: Colors.white,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              ValueListenableBuilder(
                                  valueListenable: userProfileNotifier,
                                  builder: (context, UserProfile userfile, child) {
                                    return Text(
                                      (userfile.todayTargetValue == null)
                                          ? " Target:"
                                          : " Target:  ${userfile.todayTargetValue}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                      ),
                                    );
                                  }),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FontAwesomeIcons.solidCircle,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              ValueListenableBuilder(
                                  valueListenable: smileGameNofitier,
                                  builder: (context, SmileGameVariables smilegramvariables, child) {
                                    return Text(
                                      " Today's Score:  ${smilegramvariables.numberOfStarMeetings}", //Number of meetings represents number of countires painted
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          SizedBox(height: 5,)
                        ],
                      ),
                      Icon(
                        FontAwesomeIcons.angleRight,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              //POCKET BUDDY
              TextButton(
                onPressed: () {
                  (ApiAccess().hasPayLoad() == false) ?
                  _showNetworkAlert(context: context, message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
                      :
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Pocket Buddy'),
                      content: Text(
                        'Do you want to chat with the AI bot ?',
                        //style: CustomeStyling().customContenttext(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
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
                  height: 120.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                        width: 1.0, color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(
                        FontAwesomeIcons.message,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pocket Buddy",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                              textAlign: TextAlign.center),
                          Text(
                              "Chat with our AI bot \n "
                              "Adaeze !\n ",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center),
                        ],
                      ),
                      Icon(
                        FontAwesomeIcons.angleRight,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              //TRIBE MESSAGES
              TextButton(
                onPressed: () {
                  (ApiAccess().hasPayLoad() == false) ?
                  _showNetworkAlert(context: context, message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
                      :
                  Navigator.of(context).pushNamed('/tribemessages');
                },
                child: Container(
                  height: 120.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    //  color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                        width: 1.0, color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(
                        FontAwesomeIcons.peopleGroup,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "My Tribe",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                              "Just click this button to interact \n "
                              "with our anonymous users \n globally! ",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center),
                        ],
                      ),
                      Icon(
                        FontAwesomeIcons.angleRight,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              ValueListenableBuilder(
                  valueListenable: tribeMessagesNotifier,
                  builder: (context, List<TribeMessage> value, child) {
                    return Text(
                      '${value.length} Unread SmilePacks',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    );
                  }),

              ValueListenableBuilder(
                  valueListenable: tribeMessagesNotifier,
                  builder: (context, List<TribeMessage> value, child) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        //  children: getSmilePacks(tribeMessagesNotifier.value),
                        children: getSmilePacks(value),
                      ),
                    );
                  }),
              SmileGame2(),
              SmileGame3(),
            ],
          ),
        ),
      ),
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

  Widget ball(String image, Color color) {
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

  Widget ballcard(String image, Color color) {
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
            width: 140.0,
            //height: 110.0,
            child: Card(
              elevation: 0.2,
              margin: EdgeInsets.all(15),
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
                      SizedBox(
                        height: 10,
                      ),
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
        "assets/logo1.jpeg",
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
                  print('rating: , comment: ${response.userrating}');
                  MoodModel mood = MoodModel();
                  mood.initializeMood(rating: response.userrating.round());
                  smileAppValueNotifier.initializeMoodNotifier(mood: mood);
                },
                onContinue: () {},
              ),
            ));
  }

  _showNetworkAlert({required BuildContext context, required String message,}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
              size: 26,
            )),
        content: Text(
          '$message',
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
              ApiAccess().Logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


}

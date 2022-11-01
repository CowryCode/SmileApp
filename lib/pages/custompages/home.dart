
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/config/custom_design.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/apis/Utilities.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Home extends StatefulWidget {
  final String? value;
  // const Home( {Key key, this.value}) : super(key: key);
  final bool checkEmotion;
  const Home( {Key? key,  this.value, required this.checkEmotion}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}




//TODO: CREATE INSTRUCTION PAGES
class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)  async{
      if(widget.checkEmotion == true){
        // show Rating dialog
        showDialog(
          context: context,
          barrierDismissible: true, // set to false if you want to force a rating
          builder: (context) => _showRatingAlert(context),
        );
       }
      print("GOT TO THIS POINT ::::::::: 0");
      await Firebase.initializeApp();
      print("GOT TO THIS POINT ::::::::: 1");
      await FirebaseMessaging.instance.getToken().then((token){
        print("GOT TO THIS POINT ::::::::: 2");
        ApiAccess().uploadDeviceIdentifier(token: token!);
      });
      print("GOT TO THIS POINT ::::::::: 3");

    });
    //Load the leaderboard
    ApiAccess().getLeaderBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 80,
                padding: const EdgeInsets.only(left:20.0,right: 20.0, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                  // color: Theme.of(context).accentColor,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${Utilities().AppName}',
                          style: TextStyle(
                            fontSize:22.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "Cowrycode",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                padding: const EdgeInsets.only(left: 30.0 , right: 30.0),
              ),
            ],
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('SmileGram'),
                  content: const Text('Beat the highest smile score to win redeemable points! ',
                    style: TextStyle(color: Colors.black45),
                  ),
                  actions: <Widget>[
                    TextButton(
                    //  onPressed: () => Navigator.pop(context, 'Cancel'),
                    onPressed: (){
                      Navigator.of(context).pop();
                     },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        smileAppValueNotifier.updateShowCountDown(showCoundown: true);
                        Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
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
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 2.0,),
                  Icon(FontAwesomeIcons.faceSmileBeam,color: Theme.of(context).primaryColor, size: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("SmileGram",
                          style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center
                      ),
                      Text("A smile can get you a gift and  \n "
                          "compose a great text. Try it !\n ",
                          style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
                    ],
                  ),
                  Icon(FontAwesomeIcons.angleRight,color: Theme.of(context).primaryColor, size: 40,),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              // Navigator.of(context).pushNamed('/doctorProfil');
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Pocket Buddy'),
                  content: Text('Do you want to chat with the AI bot ?',
                    style: CustomeStyling().customContenttext(),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
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
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 2.0,),
                  Icon(FontAwesomeIcons.message,color: Theme.of(context).primaryColor, size: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pocket Buddy",style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center
                      ),
                      Text("Chat with our AI bot \n "
                          "Adamma !\n "
                          ,style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Icon(FontAwesomeIcons.angleRight,color: Theme.of(context).primaryColor, size: 40,),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/tribemessages');
            },
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              //  color: Theme.of(context).colorScheme.secondary,
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
                // image: DecorationImage(
                //   image:AssetImage('images/custom/smilegram.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 2.0,),
                  Icon(FontAwesomeIcons.peopleGroup,color: Theme.of(context).primaryColor, size: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("My Tribe",style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Text("Just click this button to interact \n "
                          "with our anonymous users \n globally! "
                          ,style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                    ],
                  ),
                  Icon(FontAwesomeIcons.angleRight,color: Theme.of(context).primaryColor, size: 40,),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            // Container(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){},
                    child: Text(
                      'Unread SmilePacks',
                      style: TextStyle(
                          fontSize:12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("/tribeunreadmessages");
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize:12.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
                ],
              ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  card("images/asset-1.png","South Africa",),
                  card("images/asset-2.png","Ontario Canada",),
                  card("images/asset-3.png","Dr. Senila Aaraf",),
                ],
              ),
            ),
          ],),

        ],
      ),
     ),
    );


  }
  Widget ball(String image,Color color){
    return Container(
      height: 80,width: 80.0,
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
  Widget ballcard(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,),
      ),
    );
  }
  Widget card(String image,String message,){
    return 
     Stack(
     children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow( color: Theme.of(context).primaryColor .withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)],
          ),
          width: 140.0,
          //height: 110.0,
          child: Card(
            elevation: 0.2,
            margin: EdgeInsets.all(15),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.email_rounded, color: Theme.of(context).colorScheme.secondary,),
                    Text(
                      "From : \n $message",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10.0,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),

     ],
    );
  }

  RatingDialog _showRatingAlert(BuildContext context){
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
      image: Image.asset("assets/logo1.jpeg",width: 100, height: 100,),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        Navigator.of(context).popAndPushNamed('/home',);
        print('rating: , comment: ${response.comment}');
        MoodModel mood = MoodModel();
        mood.initializeMood(rating: response.rating.round());
        smileAppValueNotifier.initializeMoodNotifier(mood: mood);
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.green
      ),
    );
  }
}

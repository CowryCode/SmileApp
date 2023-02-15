import 'package:SmileApp/apis/models/triberequest.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/leaderboardmodel.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../apis/models/moodmodel.dart';



class TribePendingTaskWidget extends StatefulWidget {
  //final String msg;
  final TribeRequest msg;
  final int index;
  const TribePendingTaskWidget({Key? key, required this.msg, required this.index}) : super(key: key);

  @override
  _TribePendingTaskWidgetState createState() => _TribePendingTaskWidgetState();
}

class _TribePendingTaskWidgetState extends State<TribePendingTaskWidget> {

  bool showfulltext = false;
  TextEditingController textEditingController = TextEditingController();
  final sentiment = Sentiment();

  Stopwatch? stopwatch;

  @override
  void initState() {
    stopwatch = Stopwatch();
    stopwatch!.start();
  }

  @override
  void dispose() {
    super.dispose();
    stopwatch?.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
       // SizedBox(width: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(6.0),
          child:FlatButton(
            highlightColor: Theme.of(context).primaryColor,
            onPressed: (){
              setState(() {
                showfulltext = !showfulltext;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Card(
              elevation:0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
                  ],
                ),
                padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                       // '${widget.leader.name}',
                        '${widget.msg.content}',
                        textAlign: TextAlign.left,
                       // style: CustomeStyling().customContenttext(),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                      ),
                    SizedBox(height: 10,),
                    //TODO: Color this button
                    TextButton(
                        onPressed: (){
                          setState(() {
                            showfulltext = !showfulltext;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Reply", style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                          ],
                        ),
                    )
                  ],
                ),
                //   ],
                // ),
              ),
            ),
          ),
        ),
        Visibility(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '200 Character empathic messsage',
                  ),
                  maxLines: 4,
                  maxLength: 250,
                  cursorColor: Theme.of(context).colorScheme.secondary ,
                  controller: textEditingController,
                  style:  const TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                    onPressed: (){
                      double sentimentScore = sentiment.analysis(textEditingController.value.text).entries.elementAt(1).value;
                      if(sentimentScore > 0){
                        _processPageExit();
                        setState(() {
                          tribeEmpathyRequestNotifier.removedTheRepliedItem(index: widget.index);
                         // textEditingController.clear();
                          showfulltext = !showfulltext;
                        });
                      }else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Center(child: const Icon(FontAwesomeIcons.triangleExclamation,color: Colors.red, size: 26 ,)),
                            content: Text('This content may be hurtful. \n Please rephrase with kinds words only',
                              style:  const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Send", style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
                )
              ],
            ),
          ),
          visible: showfulltext,
        ),
      ],
    );
  }
  Widget ball(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,
        ),

      ),

    );
  }

  void _processPageExit() async{
    ApiAccess().replyTribeCall(tribeRequest: widget.msg, reply: textEditingController.value.text);
    // _openRatingDialog(ratingOnly: true);
    MoodModel mood = smileAppValueNotifier.value.moodmodel.value;
    mood.captureMood(
      rating: 0,
      smileduration: 0.0,
      countrycount: 0,
      timeSpent: stopwatch!.elapsedMilliseconds / 1000,
    );
    ApiAccess().saveMood(moodModel: mood, url: Tribe_Mood_URL);
  }

  RatingDialog _showRatingAlert(BuildContext context, {required bool justreadmessage}){
    return RatingDialog(
      showCloseButton: false,
      initialRating: 0.0,
      starSize: 30.0,
      // your app's name?
      title: Text(
        'Rate Your Mood',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'How good do you feel now for making another person smile?',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      //image: const FlutterLogo(size: 100),
      image: Image.asset("assets/logo1.png",width: 100, height: 100,),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        Navigator.of(context).popAndPushNamed('/home',);
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.green
      ),
    );
  }


  _openRatingDialog({required bool ratingOnly}) {
    smileAppValueNotifier.updateSoundDeactivation(deactivateSound: true);
    showDialog(
        context: context,
        builder: (context) => Dialog(
          child: RatingView(
            ratingonly: ratingOnly,
            msg: "Thank you for making someone else have a better day. \n How goes this action make you feel?",
            onExit: (response){
              smileAppValueNotifier.updateSoundDeactivation(deactivateSound: false);
              MoodModel mood = smileAppValueNotifier.value.moodmodel.value;
              mood.captureMood(
                  rating: response.userrating.round(),
                  smileduration: smileGameNofitier.getSmileDurationInSecound(),
                  countrycount: smileGameNofitier.getNumberofCountriesPainted(),
                timeSpent: stopwatch!.elapsedMilliseconds / 1000,
              );

              ApiAccess().saveMood(moodModel: mood, url: Tribe_Mood_URL);

              Navigator.of(context).popAndPushNamed('/home');
            },
            onContinue: (){
              smileAppValueNotifier.updateSoundDeactivation(deactivateSound: false);
              Navigator.pop(context);
            },
          ),
        )
    );
  }

}
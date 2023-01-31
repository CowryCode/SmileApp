import 'dart:convert';
import 'dart:math';

import 'package:SmileApp/models/smilefactmodel.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/ratingcontroller.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class SmileGramAchievement extends StatefulWidget {
  final bool readmessage ;
  final bool ratingonly;
  final String? msg;
  // const RatingView({Key? key, this.readmessage = false, this.ratingonly = false, }) : super(key: key); // Stable version 29-12-2022
  const SmileGramAchievement({
    Key? key,
    this.readmessage = false,
    this.ratingonly = false,
    this.msg,
    required this.onContinue,
    required this.onExit,
  });

  /// Returns a RatingDialogResponse with user's rating and comment values.
  final Function() onContinue;
  final Function(RatingDialogResponse) onExit;

  @override
  _SmileGramAchievementState createState() => _SmileGramAchievementState();
}

class _SmileGramAchievementState extends State<SmileGramAchievement>{
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  //var _rating = 0;
  var _rating = 5;

  bool ratingSubmitted = false;
  String emotion = "";
  String _currentAnimation = 'Very Happy+';
 // String _currentAnimation = "";
  RatingController _ratingcontroller = RatingController();

  String fact = SmileFactsModel().modelsDictionary();

  void _onChanged({required double value}) {
    if (_rating == value) return;
    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value.round();
      switch (_rating.round()) {
        case 1:
          emotion = "Very Sad";
          break;
        case 2:
          emotion = "Sad";
          break;
        case 3:
          emotion = "Neutral";
          break;
        case 4:
          emotion = "Happy";
          break;
        case 5:
          emotion = "Very Happy";
          break;
      }
      _currentAnimation = '${value.round()}$direction';
    });
  }

  RatingDialogResponse? _response;

  @override
  void initState() {
    super.initState();
    _response = RatingDialogResponse(ratingOnly: widget.ratingonly, userrating: _rating);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //THE FLR EMOJI
            Positioned(
              top: 0,
              left: 0,
              right: 25,
              child: AnimatedOpacity(
                opacity:  _rating > 0 ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                    height: 100,
                    width: 100,
                    /*flr file is created from RIV*/
                    child: FlareActor(
                      'assets/happiness_emoji.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      controller: _ratingcontroller,
                      animation: _currentAnimation,
                    )),
              ),
            ),


          //RATING CONTENT
          Container(
            height: max(350, MediaQuery.of(context).size.height * 0.3),
           // margin:  const EdgeInsets.only(left: 5, right: 5, top: 1),
            margin:  const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _userRatingMessage(funcFact: fact),
                //_userRating(msg: widget.msg),
              ],
            ),
          ),

          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
               // color: Theme.of(context).colorScheme.secondary,
                color: (widget.ratingonly == true && _rating < 1) ? Colors.white : Theme.of(context).colorScheme.secondary,
                child: Column(
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(bottom: 2, top: 10),
                         child: Text("Do you want to continue playing?")
                     ),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           MaterialButton(
                             onPressed: () {
                               _continueAction(exit: true);
                             } ,
                             child: Visibility(
                               visible: _rating > 0,
                               child: Text(
                                 'Exit',
                                 style: TextStyle(
                                     color: Theme.of(context).primaryColor,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0),
                               ),
                             ),
                           ),
                           //  SizedBox(width: 20,),
                           MaterialButton(
                             onPressed: () {
                               _continueAction(exit: false);
                             } ,
                             child: Visibility(
                               visible: _rating > 0,
                               child: Text(
                                 'Continue',
                                 style: TextStyle(
                                     color: Theme.of(context).primaryColor,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0),
                               ),
                             ),
                           ),
                         ]),
                   ],
                ),
                // child: Visibility(
                //  // visible: ratingSubmitted,
                //   visible: true,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       MaterialButton(
                //         onPressed: () {
                //           print('EXIT STAGE 0');
                //               _continueAction(exit: true);
                //            } ,
                //         child: Visibility(
                //           visible: _rating > 0,
                //           child: Text(
                //             'Exit',
                //             style: TextStyle(
                //                 color: Theme.of(context).primaryColor,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20.0),
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 20,),
                //       MaterialButton(
                //           onPressed: () {
                //              _continueAction(exit: false);
                //           } ,
                //           child: Visibility(
                //             visible: _rating > 0,
                //             child: Text(
                //               'Continue',
                //               style: TextStyle(
                //                   color: Theme.of(context).primaryColor,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20.0),
                //             ),
                //           ),
                //         ),
                //   ]),
                //   replacement: MaterialButton(
                //     onPressed: _submit,
                //     child: Visibility(
                //       visible: _rating > 0,
                //       child: Text(
                //         'Submit',
                //         style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20.0),
                //       ),
                //     ),
                //   ),
                // )
              )
          ),
        ],
      ),
    );
  }


  _userRatingMessage({required String funcFact}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Congratulations!',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: smileGameNofitier,
                builder: (context, SmileGameVariables smilegramvariables, child) {
                  return Text(
                    " ${smilegramvariables.numberOfStarMeetings} ", //Number of meetings represents number of countires painted
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
            Text(
              " Countries Achieved.",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        SizedBox(height: 5,),
        Text(
          'Smile Fun Fact!',
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
            fontFamily: 'Poppins',
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '$funcFact',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        // Text(
        //   'Do you want to continue playing?',
        //   style:  TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color: Theme.of(context).colorScheme.secondary,
        //     fontFamily: 'Poppins',
        //     fontSize: 14.0,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }


  _submit() {
    if(widget.ratingonly == true){
      _continueAction(exit: true);
    }else{
      _ratingPageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() {
        ratingSubmitted = true;
      });
    }
  }

  _continueAction({required bool exit}){
    print('EXIT STAGE 1');
    if  ( _rating < 1)  return;

    if(exit == true){
      print('EXIT STAGE 2');
      _response!.userrating = _rating;
      widget.onExit.call(_response!);
    }else{
      print('EXIT STAGE 3');
      widget.onContinue.call();
    }

  //  if (Navigator.canPop(context)) Navigator.pop(context);
  }



}

class RatingDialogResponse {
  int userrating;
  bool ratingOnly;
  RatingDialogResponse({this.userrating = 0, required this.ratingOnly});
}

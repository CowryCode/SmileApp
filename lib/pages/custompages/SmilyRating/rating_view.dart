import 'dart:math';

import 'package:SmileApp/models/smilefactmodel.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/ratingcontroller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class RatingView extends StatefulWidget {
  final bool readmessage ;
  final bool ratingonly;
  final String? msg;
  // const RatingView({Key? key, this.readmessage = false, this.ratingonly = false, }) : super(key: key); // Stable version 29-12-2022
  const RatingView({
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
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;

  bool ratingSubmitted = false;
  String emotion = "";
  String _currentAnimation = "";
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
            Positioned(
              top: 13,
              left: 0,
              right: 25,
              child: AnimatedOpacity(
                opacity: _rating < 1 ? 1 : 0,
                duration: (Duration(milliseconds: 400)),
                child: Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0)),
                      image: DecorationImage(
                        image: AssetImage('assets/logo1.jpeg'),
                        //fit: BoxFit.cover,
                        fit: BoxFit.scaleDown,
                      ),
                    )),
              ),
            ),
          //RATING CONTENT
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _userRating(msg: widget.msg),
                _userRatingMessage(funcFact: fact),
              ],
            ),
          ),
          //Rating ICONS
          AnimatedPositioned(
              top: _starPosition,
              left: 0,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => IconButton(
                          icon: index < _rating
                              ? Icon(
                                  Icons.star,
                                  // size: 32,color: Colors.orange,
                                  size: 32, color: Colors.amber,
                                )
                              : Icon(
                                  // Icons.star_border,
                                  Icons.star,
                                  // size: 32, color: Colors.orange,
                                  size: 32, color: Colors.black45,
                                ),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            setState(() {
                              _onChanged(value: index + 1);
                            });
                          },
                        )),
              ),
              duration: Duration(milliseconds: 300)),

          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
               // color: Theme.of(context).colorScheme.secondary,
                color: (widget.ratingonly == true && _rating < 1) ? Colors.white : Theme.of(context).colorScheme.secondary,
                child: Visibility(
                  visible: ratingSubmitted,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          print('EXIT STAGE 0');
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
                      SizedBox(width: 20,),
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
                  replacement: MaterialButton(
                    onPressed: _submit,
                    child: Visibility(
                      visible: _rating > 0,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                )
              )
          ),
        ],
      ),
    );

    // return AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15.0),
    //   ),
    //   titlePadding: EdgeInsets.zero,
    //   scrollable: true,
    //   title: _content,
    // );
  }

  _userRating({String? msg}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _rating > 0 ? '$emotion' : 'Rate Your Feeling',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
         (msg == null) ? 'Let us know how you feel after using this feature.' : msg,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _userRatingMessage({required String funcFact}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Smile Fun Fact!',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          '$funcFact',
          style: TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
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
     // if (Navigator.canPop(context))  Navigator.of(context).popAndPushNamed('/home',);
     // if (Navigator.canPop(context)) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigateTabsWidget(showEmotionalert: false,)));
    }else{
      print('EXIT STAGE 3');
      widget.onContinue.call();
     // Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
     // if (Navigator.canPop(context)) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FaceDetectorGiftView(giftVariableObject: new GiftVariableObject(readmessage: false))));
    }

  //  if (Navigator.canPop(context)) Navigator.pop(context);
  }



}

class RatingDialogResponse {
  int userrating;
  bool ratingOnly;
  RatingDialogResponse({this.userrating = 0, required this.ratingOnly});
}

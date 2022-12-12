import 'dart:math';

import 'package:SmileApp/models/smilefactmodel.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/ratingcontroller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

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
  RatingController _controller = RatingController();

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
                      controller: _controller,
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
                _userRating(),
                _userRatingMessage(),
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
          //SUBMIT BUTTON
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //       color: Theme.of(context).colorScheme.secondary,
          //       child: MaterialButton(
          //         onPressed: _submit,
          //         child: Visibility(
          //           visible: _rating > 0,
          //           child: Text(
          //             'Submit',
          //             style: TextStyle(
          //                 color: Theme.of(context).primaryColor,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20.0),
          //           ),
          //         ),
          //       ),
          //     )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Visibility(
                  visible: ratingSubmitted,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    MaterialButton(
                      onPressed: _continueAction,
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
                        onPressed: _continueAction,
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
  }

  _userRating() {
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
          'Let us know how you feel after using this feature.',
          style: TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _userRatingMessage() {
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
          '${SmileFactsModel().modelsDictionary()}',
          style: TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  _submit() {
    _ratingPageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    setState(() {
      ratingSubmitted = true;
    });
  }

  _continueAction(){
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}

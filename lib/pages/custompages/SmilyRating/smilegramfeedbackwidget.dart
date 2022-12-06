import 'package:SmileApp/pages/custompages/SmilyRating/ratingcontroller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmileGramFeedBackWidget extends StatefulWidget {
  const SmileGramFeedBackWidget({Key? key}) : super(key: key);

  @override
  _SmileGramFeedBackWidgetState createState() =>
      _SmileGramFeedBackWidgetState();
}

class _SmileGramFeedBackWidgetState extends State<SmileGramFeedBackWidget> {
// Very Sad, Sad, Neutral, Happy, Very Happy
  double _rating = 1.0;
  String emotion = "Very Sad";
  String _currentAnimation = "1+";
  RatingController _controller = RatingController();
  void _onChanged(double value) {
    if(_rating == value) return;
    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      int cases =_rating.round();
      switch(_rating.round()){
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
        height: MediaQuery
            .of(context)
            .size
            .height * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // color: Colors.green,
          // image: DecorationImage(
          //   image: AssetImage('images/custom/giftopen.png'),
          //   fit: BoxFit.cover,
          // )
        ),
        child: Column(
          children: <Widget>[
            Icon(FontAwesomeIcons.faceSmile, color: Theme
                .of(context)
                .colorScheme
                .secondary,),
            Container(
                height:300,
                width: 300,
                /*flr file is created from RIV*/
                child: FlareActor('assets/happiness_emoji.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  controller: _controller,
                  animation: _currentAnimation,
                )
            ),
            Slider(
                value: _rating,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: _onChanged
            ),
            Text(
              '$emotion',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            )
            // Center(
            //   //  child: Text(' Congratulations! your won $_value points', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //         fontSize: 30.0, fontFamily: 'SF', color: Colors.red),
            //     child: Center(
            //       child: AnimatedTextKit(
            //         repeatForever: true,
            //         animatedTexts: [
            //           ScaleAnimatedText('x points won!',
            //               scalingFactor: 0.2, textAlign: TextAlign.center),
            //           ScaleAnimatedText('You try Jor !',
            //               scalingFactor: 0.2, textAlign: TextAlign.center),
            //           ScaleAnimatedText('y oints won!',
            //               scalingFactor: 0.2, textAlign: TextAlign.center),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}

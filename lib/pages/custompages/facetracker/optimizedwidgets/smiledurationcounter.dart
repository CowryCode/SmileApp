import 'dart:async';

import 'package:SmileApp/statemanagement/actions.dart';
import 'package:SmileApp/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/statemanagement/my_app_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SmileDurationCounter extends StatefulWidget {
  const SmileDurationCounter({Key? key}) : super(key: key);

  @override
  _SmileDurationCounterState createState() => _SmileDurationCounterState();
}

class _SmileDurationCounterState extends State<SmileDurationCounter> {

  int countValue = 5;


  @override
  void initState() {
    _randomize();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ScaleAnimatedText('T$countValue',
          scalingFactor: 0.2,
          textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.green,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _randomize(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if (countValue <= 0) {
        // debugPrint('Countdown Ended');
        // SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
        // sgMessage.setShowCountdown(countDownVisibility: false);
        // StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMessage));
        timer.cancel();
      }else{
        setState(() {
          countValue = countValue - 1;
          debugPrint('Timer Count Value : $countValue');
        });
      }
    });
  }
}

import 'dart:async';

import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  int countValue = 5;


  @override
  void initState() {
   // _randomize();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("${countValue}",
    //     style: const TextStyle(
    //         fontSize: 33.0,
    //         color: Colors.green,
    //         fontWeight: FontWeight.bold),
    //   ),
    // );
    return StoreConnector<MyAppState, SGMessage>(
    converter: (store) => store.state.sg_message,
    builder: (context, SGMessage currentMessagestate) => CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: CountDownController(),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          // fillColor: Colors.purpleAccent[100]!,
          fillColor: Colors.green[300]!,
          fillGradient: null,
          // backgroundColor: Colors.purple[500],
          backgroundColor: Colors.green[700],
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
         // textStyle: const TextStyle(
          textStyle: TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: false,
          isReverseAnimation: false,
          isTimerTextShown: true,
          // autoStart: true,
          autoStart: currentMessagestate.showStartCountDown,
          onStart: () {
            //debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
            SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
            sgMessage.setShowCountdown(countDownVisibility: false);
            StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMessage));
          },
          onChange: (String timeStamp) {
            //debugPrint('Countdown Changed $timeStamp');
          },
        ),
      );
    }

void _randomize(){
  // Timer.periodic(Duration(seconds: 1), (timer){
  //   if (countValue <= 0) {
  //     debugPrint('Countdown Ended');
  //     SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
  //     sgMessage.setShowCountdown(countDownVisibility: false);
  //     StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMessage));
  //     timer.cancel();
  //   }else{
  //     setState(() {
  //       countValue = countValue - 1;
  //       debugPrint('Timer Count Value : $countValue');
  //     });
  //   }
  // });
}
}


import 'dart:async';

import 'package:SmileApp/statemanagement/notifiers/countdownnotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  //int countValue = 5;

  late CountDownValueNotifier countValue;
  late Timer coundowntimer;


  @override
  void initState() {
    countValue = CountDownValueNotifier(value: 5);
    coundowntimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(countValue.getCurrentValue() <= 0 ){
        coundowntimer.cancel();
          smileAppValueNotifier.updateShowCountDown(showCoundown: false);
      }else{
        countValue.decrement();
      }
    });
  }

  @override
  void dispose() {
    coundowntimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: countValue,
      builder: (context, value, child) {
        return Text(
          "$value",
          style: const TextStyle(
              fontSize: 33.0, color: Colors.green, fontWeight: FontWeight.bold),
        );
      },
    );
    // return Container(
    //   child: Text(
    //     "${countValue}",
    //     style: const TextStyle(
    //         fontSize: 33.0, color: Colors.green, fontWeight: FontWeight.bold),
    //   ),
    // );
    // return StoreConnector<MyAppState, SGMessage>(
    // converter: (store) => store.state.sg_message,
    // builder: (context, SGMessage currentMessagestate) => CircularCountDownTimer(
    //       duration: 10,
    //       initialDuration: 0,
    //       controller: CountDownController(),
    //       width: MediaQuery.of(context).size.width / 2,
    //       height: MediaQuery.of(context).size.height / 2,
    //       ringColor: Colors.grey[300]!,
    //       ringGradient: null,
    //       fillColor: Colors.green[300]!,
    //       fillGradient: null,
    //       backgroundColor: Colors.green[700],
    //       backgroundGradient: null,
    //       strokeWidth: 20.0,
    //       strokeCap: StrokeCap.round,
    //       textStyle: const TextStyle(
    //           fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
    //       textFormat: CountdownTextFormat.S,
    //       isReverse: false,
    //       isReverseAnimation: false,
    //       isTimerTextShown: true,
    //       // autoStart: true,
    //       autoStart: currentMessagestate.showStartCountDown,
    //       onStart: () {
    //         //debugPrint('Countdown Started');
    //       },
    //       onComplete: () {
    //         debugPrint('Countdown Ended');
    //         SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
    //         sgMessage.setShowCountdown(countDownVisibility: false);
    //         StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMessage));
    //       },
    //       onChange: (String timeStamp) {
    //       },
    //     ),
    //   );
  }

}

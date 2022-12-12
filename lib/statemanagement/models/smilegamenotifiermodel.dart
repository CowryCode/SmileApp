import 'dart:ffi';
import 'dart:math';

import 'package:SmileApp/apis/networkUtilities.dart';

class SmileGameVariables {
  bool direction = true;
  bool targetCaught = false;
  double targetVerticalposition = 0.0;
  double movingObjectVerticalposition = 10.0; // ORIGINAL CODE
  double targetHorrizontalposition;
  double movingObjectHorrizontalposition;
  SmileGameVariables({required this.targetHorrizontalposition , required this.movingObjectHorrizontalposition});

  void move({required double smileProb}) {
    double speedInterval = smileProb < 0.6 ? 1.0 : smileProb < 0.75 ? 2.0 : 3.0;
    //MOVE THE OBJECT RIGHT TO LEFT
    if (!direction) {
      movingObjectHorrizontalposition = (movingObjectHorrizontalposition >= speedInterval)
          ? (movingObjectHorrizontalposition - speedInterval)
          : MinimumLocation ;
    }
    //MOVE THE OBJECT LEFT TO RIGHT
    /* 10 was added because of the difference in size between
       the Target Object (big) and the moving object(Small) */
    if (direction) {
      movingObjectHorrizontalposition = ((movingObjectHorrizontalposition + speedInterval) <= (MaximumHorrizontalLocation + 10))
          ? (movingObjectHorrizontalposition + speedInterval)
          : MaximumHorrizontalLocation + 10;
    }

    if(movingObjectHorrizontalposition == (MaximumHorrizontalLocation + 10)
        || movingObjectHorrizontalposition == MinimumLocation ) direction = !direction;

    if(movingObjectHorrizontalposition == (targetHorrizontalposition + 10) ||
        movingObjectHorrizontalposition == (targetHorrizontalposition + 11) ||
        movingObjectHorrizontalposition == (targetHorrizontalposition + 9)){
      targetCaught = true;
    }else{
      targetCaught = false;
    }
  }

  /* WHEN DIRECTION IS TRUE, OBJECGT IS MOVING FROM LEFT TO RIGHT
     WHEN DIRECTION IS FALSE, OBJECT IS MOVING FROM RIGHT TO LEFT
     ALL HORRIZONTAL POSITIONS ARE TAKING BEARING FROM THE LEFT */
  void _updateDirection(){
    if(targetHorrizontalposition > movingObjectHorrizontalposition) direction = true;
    if(targetHorrizontalposition < movingObjectHorrizontalposition) direction = false;
  }

  void changeTargeObjectPositon() {

    targetVerticalposition = Random().nextInt(MaximumVerticalLocation).roundToDouble();
    // This 10 was added to align the height of the  target Object and the moving object (which is smaller)
    movingObjectVerticalposition = targetVerticalposition + 10;

    targetHorrizontalposition = Random().nextInt(MaximumHorrizontalLocation.round()).roundToDouble();
    /* USER NEED TO USE SMILE TO CLOSE THE DISTANCE SO THEY CAN LAP ON EACH OTHER */
    movingObjectHorrizontalposition = (targetHorrizontalposition + TargetObjectDistance)
        >= MaximumHorrizontalLocation ? (targetHorrizontalposition - TargetObjectDistance)
        : (targetHorrizontalposition + TargetObjectDistance);

    _updateDirection();
  }
}

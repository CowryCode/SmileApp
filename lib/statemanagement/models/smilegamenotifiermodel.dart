import 'dart:ffi';
import 'dart:math';

import 'package:SmileApp/apis/networkUtilities.dart';

class SmileGameVariables {
  bool direction = true;
  double targetVerticalposition = 0.0;
  double movingObjectVerticalposition = 0.0;
  double targetHorrizontalposition;
  double movingObjectHorrizontalposition;
  SmileGameVariables({required this.targetHorrizontalposition , required this.movingObjectHorrizontalposition});

  void move({required double smileProb}) {
    double speedInterval = smileProb < 0.6 ? 1.0 : smileProb < 0.75 ? 2.0 : 3.0;
    //MOVE THE OBJECT RIGHT TO LEFT
    if (!direction) {
      movingObjectHorrizontalposition = (movingObjectHorrizontalposition >= speedInterval)
          ? (movingObjectHorrizontalposition - speedInterval)
          : MinimumHorrizontalLocation;
    }
    //MOVE THE OBJECT LEFT TO RIGHT
    if (direction) {
      movingObjectHorrizontalposition = ((movingObjectHorrizontalposition + speedInterval) <= MaximumHorrizontalLocation)
          ? (movingObjectHorrizontalposition + speedInterval)
          : MaximumHorrizontalLocation;
    }

    if(movingObjectHorrizontalposition == MaximumHorrizontalLocation
        || movingObjectHorrizontalposition == MaximumHorrizontalLocation ) direction = !direction;
  }

  /* WHEN DIRECTION IS TRUE, OBJECGT IS MOVING FROM LEFT TO RIGHT
     WHEN DIRECTION IS FALSE, OBJECT IS MOVING FROM RIGHT TO LEFT
     ALL HORRIZONTAL POSITIONS ARE TAKING BEARING FROM THE LEFT */
  void _updateDirection(){
    if(targetHorrizontalposition > movingObjectHorrizontalposition) direction = true;
    if(targetHorrizontalposition < movingObjectHorrizontalposition) direction = false;
  }

  void changeTargeObjectPositon() {
    bool dir = Random().nextBool();
    if (dir) {
      targetHorrizontalposition = ((movingObjectHorrizontalposition + TargetObjectDistance) <= MaximumHorrizontalLocation )
          ? (movingObjectHorrizontalposition + TargetObjectDistance) : movingObjectHorrizontalposition - TargetObjectDistance;
    }else{
      //0 IS THE LEAST MAR
      targetHorrizontalposition = ((movingObjectHorrizontalposition - TargetObjectDistance) >= MinimumHorrizontalLocation )
          ? (movingObjectHorrizontalposition - TargetObjectDistance) : movingObjectHorrizontalposition + TargetObjectDistance;
    }
    targetVerticalposition = Random(300).nextDouble();
    // This 10 was added to align the height of the  target Object and the moving object (which is smaller)
    movingObjectVerticalposition = targetVerticalposition + 10;
    _updateDirection();
  }
}

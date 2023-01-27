import 'dart:ffi';
import 'dart:math';

import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';

class SmileGameVariables {
  int smileDurationCounter = 0;
  bool direction = true;
  bool targetCaught = false;
  double targetVerticalposition = 0.0;
  double movingObjectVerticalposition = 10.0; // ORIGINAL CODE
  double targetHorrizontalposition;
  double movingObjectHorrizontalposition;
  int numberOfStarMeetings = 0; // EACH TIME THE STARS MEET, A COUNTRY IS PAINTED
  SmileGameVariables({required this.targetHorrizontalposition , required this.movingObjectHorrizontalposition});

  void move({required double smileProb, required bool isSmilegram}) {
    // Update this count each time user is smiling
    smileDurationCounter++;

    if(!isSmilegram) return;

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

    if(movingObjectHorrizontalposition == (targetHorrizontalposition + 10) || movingObjectHorrizontalposition == (targetHorrizontalposition - 10)){
      targetCaught = true;
      numberOfStarMeetings++;
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

  void updateTargetCaught({required bool holdtargetObject}){
    targetCaught = holdtargetObject;
  }

  double getSmileDurationInSeconds(){
    /* 4.5 counts == 1sec*/
    return double.parse((smileDurationCounter/4.5).toStringAsFixed(2));
  }

  int getSmileDurationCounter(){
   // return double.parse((smileDurationCounter).toStringAsFixed(2));
    return smileDurationCounter;
  }

  void setNumberOfMeetings({required int numberOfCountries}){
    this.numberOfStarMeetings = numberOfCountries;
  }

  int getSmileNumberofCountriesPainted(){
    return numberOfStarMeetings;
  }

  void refresh(){
    this.targetHorrizontalposition = TargetObjectHorrizontalInitializer;
    this.movingObjectHorrizontalposition = TargetObjectHorrizontalInitializer - TargetObjectDistance;
    this.numberOfStarMeetings = 0;
    this.smileDurationCounter = 0;
  }
}

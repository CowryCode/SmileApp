import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/networkUtilities.dart';

class SmileGameNofitier extends ValueNotifier<SmileGameVariables>{
  // SmileGameVariables smileGameVariables = SmileGameVariables(
  //     targetHorrizontalposition: TargetObjectHorrizontalInitializer,
  //     movingObjectHorrizontalposition: TargetObjectHorrizontalInitializer - TargetObjectDistance);
  SmileGameNofitier({required SmileGameVariables  value}) : super(value);

  void moveObject({required double smilesize, required isSmileGram}){
     value.move(smileProb: smilesize, isSmilegram: isSmileGram);
    notifyListeners();
  }

  void changeTargetObjectPosition(){
    value.changeTargeObjectPositon();
    notifyListeners();
  }

  void updateTargetCaught({required bool holdTarget}){
    value.updateTargetCaught(holdtargetObject: holdTarget);
    notifyListeners();
  }

  void resetGameVariables(){
    value.refresh();
    notifyListeners();
  }

  double getSmileDurationInSecound() {
    return value.getSmileDurationInSeconds();
  }
  double getSmileDurationCounter(){
    return value.getSmileDurationCounter();
  }

  int getNumberofCountriesPainted(){
    return value.getSmileNumberofCountriesPainted();
  }
}
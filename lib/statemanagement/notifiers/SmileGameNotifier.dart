import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/networkUtilities.dart';

class SmileGameNofitier extends ValueNotifier<SmileGameVariables>{
  SmileGameNofitier({required SmileGameVariables  value}) : super(value);

  void moveObject({required double smilesize, required isSmileGram}){
     value.move(smileProb: smilesize, isSmilegram: isSmileGram);
    notifyListeners();
  }

  void setTodayScore({required int countryCount}){
    value.setNumberOfMeetings(numberOfCountries: countryCount);
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

  int getSmileDurationCounter(){
    return value.getSmileDurationCounter();
  }

  int getNumberofCountriesPainted(){
    return value.getSmileNumberofCountriesPainted();
  }
}
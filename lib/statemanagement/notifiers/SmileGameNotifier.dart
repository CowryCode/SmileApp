import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/networkUtilities.dart';

class SmileGameNofitier extends ValueNotifier<SmileGameVariables>{
  SmileGameNofitier({required SmileGameVariables  value}) : super(value);

  void moveSmileGramGame({required bool isSmileGram}){
    //value.move(smileProb: smilesize, isSmilegram: isSmileGram); //
    value.moveSmileGramGame(isSmilegram: isSmileGram);
    notifyListeners();
  }

  void checkIfObjectsMet(){
    value.checkIfObjectsAligned();
    notifyListeners();
  }

  // void moveObject({required double smilesize, required isSmileGram}){
  //    //value.move(smileProb: smilesize, isSmilegram: isSmileGram); //
  //   notifyListeners();
  // }

  void changeTargetObjectPosition(){
    //value.changeTargeObjectPositon(); // Uncomment if you want to revert to the previous game
   // notifyListeners();
  }

  void setTodayScore({required int countryCount}){
    value.setNumberOfMeetings(numberOfCountries: countryCount);
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

  //TODO: REMOVE THIS METHOD,IT WAS JUST USED FOR SIMULATION
  updateMeetingCount(){
    value.updateMeetingCount();
    notifyListeners();
  }
}
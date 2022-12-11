import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/networkUtilities.dart';

class SmileGameNofitier extends ValueNotifier<SmileGameVariables>{
  SmileGameVariables smileGameVariables = SmileGameVariables(
      targetHorrizontalposition: TargetObjectHorrizontalInitializer,
      movingObjectHorrizontalposition: TargetObjectHorrizontalInitializer - TargetObjectDistance);
  SmileGameNofitier({required SmileGameVariables  value}) : super(value);

  void moveObject({required double smilesize}){
     value.move(smileProb: smilesize);
     notifyListeners();
  }

  void changeTargetObjectPosition(){
    value.changeTargeObjectPositon();
    notifyListeners();
  }
}
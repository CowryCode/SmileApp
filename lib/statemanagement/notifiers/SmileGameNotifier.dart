import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:flutter/cupertino.dart';

class SmileGameNofitier extends ValueNotifier<SmileGameVariables>{
  SmileGameVariables smileGameVariables = SmileGameVariables(targetHorrizontalposition: 100, movingObjectHorrizontalposition: 50);
  SmileGameNofitier({required SmileGameVariables  value}) : super(value);

  void moveObject({required double smilesize}){
  }
}
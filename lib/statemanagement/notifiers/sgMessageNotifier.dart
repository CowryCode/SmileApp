import 'package:SmileApp/statemanagement/notifiers/SGmessageModel.dart';
import 'package:flutter/material.dart';

class SGmessageNotifier extends ValueNotifier<SGmessageModel> {
  SGmessageModel sGmessageModel = SGmessageModel(msg: "",index: 0);
  SGmessageNotifier({required SGmessageModel  value}) : super(value);



  void update({required String message, required int index}) {
    value.updateSGmessage(message: message, index: index);
    notifyListeners();
  }
}
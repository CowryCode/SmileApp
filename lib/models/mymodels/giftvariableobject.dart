import 'package:SmileApp/pages/custompages/tribe_messages.dart';
import 'package:flutter/material.dart';

class GiftVariableObject {
  String? id = UniqueKey().toString();
  // TribeMessageModel? messageModel;
  String? msg;
  bool? readmessage;

  GiftVariableObject.init();
  //GiftVariableObject({this.messageModel, required this.readmessage});
  GiftVariableObject({this.msg, required this.readmessage});
  GiftVariableObject getGiftVariable() {
   // return new GiftVariableObject(fulltext: "", readmessage: false);
    return new GiftVariableObject(readmessage: false);
  }
}
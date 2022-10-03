import 'package:SmileApp/pages/custompages/tribe_messages.dart';
import 'package:flutter/material.dart';

class GiftVariableObject {
  String? id = UniqueKey().toString();
 // String? fulltext;
  TribeMessageModel? messageModel;
  bool? readmessage;

  GiftVariableObject.init();
 // GiftVariableObject({this.fulltext, this.readmessage});
  GiftVariableObject({this.messageModel, required this.readmessage});
  GiftVariableObject getGiftVariable() {
   // return new GiftVariableObject(fulltext: "", readmessage: false);
    return new GiftVariableObject(readmessage: false);
  }
}
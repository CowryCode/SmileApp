import 'package:flutter/material.dart';

class GiftVariableObject {
  String? id = UniqueKey().toString();
  String? fulltext;
  bool? readmessage;

  GiftVariableObject.init();
  GiftVariableObject({this.fulltext, this.readmessage});
  GiftVariableObject getGiftVariable() {
    return new GiftVariableObject(fulltext: "", readmessage: false);
  }
}
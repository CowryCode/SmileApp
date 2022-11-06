
import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:flutter/cupertino.dart';

class ReadTribeMessagesNotifier extends ValueNotifier<List<TribeMessage>>{
  List<TribeMessage> messages = [];

  ReadTribeMessagesNotifier({required List<TribeMessage> value }) : super(value);

  void updateMessageList({required List<TribeMessage> requestlist}){
    value = requestlist;
    notifyListeners();
  }
}
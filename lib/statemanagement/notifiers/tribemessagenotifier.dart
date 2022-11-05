import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:flutter/cupertino.dart';

class TribeMessagesNotifier extends ValueNotifier<List<TribeMessage>>{
  List<TribeMessage> messages = [];

  TribeMessagesNotifier({required List<TribeMessage> value }) : super(value);

  void updateTribeMessageList({required List<TribeMessage> requestlist}){
    value = requestlist;
    notifyListeners();
  }
}
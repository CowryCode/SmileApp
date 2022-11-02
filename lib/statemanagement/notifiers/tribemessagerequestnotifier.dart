import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:flutter/cupertino.dart';

class TribeMessagesRequestNotifier extends ValueNotifier<List<TribeMessage>>{
  List<TribeMessage> empathrequest = [];

  TribeMessagesRequestNotifier({required List<TribeMessage> value }) : super(value);

  void updateEmpathyRequestList({required List<TribeMessage> requestlist}){
    value = requestlist;
    notifyListeners();
  }
}
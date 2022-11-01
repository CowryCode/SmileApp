import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:flutter/cupertino.dart';

class EmpathyRequestNotifier extends ValueNotifier<List<TribeMessage>>{
  List<TribeMessage> empathrequest = [];

  EmpathyRequestNotifier({required List<TribeMessage> value }) : super(value);

  void updateEmpathyRequestList(List<TribeMessage> requestlist){
    value = requestlist;
    notifyListeners();
  }
}
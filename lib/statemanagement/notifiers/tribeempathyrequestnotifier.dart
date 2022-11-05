import 'package:SmileApp/apis/models/triberequest.dart';
import 'package:flutter/cupertino.dart';

class TribeEmpathyRequestNotifier extends ValueNotifier<List<TribeRequest>>{

  List<TribeRequest> requests = [];

  TribeEmpathyRequestNotifier({required List<TribeRequest> value }) : super(value);

  void updateEmpathyRequests({required List<TribeRequest> update}){
    value = update;
  }

}
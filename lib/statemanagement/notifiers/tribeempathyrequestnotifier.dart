import 'package:SmileApp/apis/models/triberequest.dart';
import 'package:flutter/cupertino.dart';

class TribeEmpathyRequestNotifier extends ValueNotifier<List<TribeRequest>>{

  List<TribeRequest> requests = [];

  TribeEmpathyRequestNotifier({required List<TribeRequest> value }) : super(value);

  void updateEmpathyRequests({required List<TribeRequest> update}){
    print('The List Original is : ${value.length}');
    value = update;
    notifyListeners();
  }

  void removedTheRepliedItem({required int index}){

    List<TribeRequest> updated = value..removeAt(index);
    value = updated;
    notifyListeners();
  }

}
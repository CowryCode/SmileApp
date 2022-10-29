import 'package:SmileApp/apis/models/personalprogressmodel.dart';
import 'package:flutter/cupertino.dart';

class ProgressTableNotifier extends ValueNotifier<List<PersonalProgresses>> {
  List<PersonalProgresses> progressetable = [
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
    PersonalProgresses(targetValue: 170, scoredValue: 0),
  ];
  ProgressTableNotifier({required List<PersonalProgresses> value }) : super(value);

  void updateScoreTable({required List<PersonalProgresses> table}){
    value = table;
    notifyListeners();
  }
}
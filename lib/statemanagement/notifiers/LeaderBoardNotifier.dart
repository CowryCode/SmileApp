import 'package:SmileApp/apis/models/globalprogressmodel.dart';
import 'package:flutter/cupertino.dart';

class LeaderBoardNotifier extends ValueNotifier<List<GlobalProgresses>>{
  List<GlobalProgresses> leaderboardtable = [
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
    GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  ];
  LeaderBoardNotifier({required List<GlobalProgresses> value}) : super(value);

  void updateScoreRanking({required List<GlobalProgresses> globalscores}){
    value = globalscores;
    notifyListeners();
  }
}


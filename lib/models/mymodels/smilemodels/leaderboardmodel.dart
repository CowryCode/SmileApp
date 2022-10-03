
import 'package:flutter/material.dart';

class LeaderBoardModel{
  String? id = UniqueKey().toString();
  String? name;
  int? count;
  double? percentage;
  String? avartar;

  LeaderBoardModel.init();
  LeaderBoardModel({this.name, this.count, this.percentage, this.avartar});
  LeaderBoardModel getCurrentLeaderBoardModel(){
    return LeaderBoardModel(name: "Name 1", count: 10, percentage: 60.0, avartar: 'images/imageuser.png');
  }
}

class LeaderBoardModelLIST{
  List<LeaderBoardModel>? _leaderboards;
  LeaderBoardModelLIST(){
    this._leaderboards = [
      new LeaderBoardModel(
          name:  "I feel scared, lonely and anxious. From Halifax ", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "I feel Sad, lonely and anxious. From USA", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "I feel Anxious, lonely and anxious. From South Africa", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "I feel ill, lonely and anxious. From Australia", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "I feel disturbed, lonely and anxious. From Ghana", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
    ];
  }
  List<LeaderBoardModel>? get leaderboardlist => _leaderboards;
}
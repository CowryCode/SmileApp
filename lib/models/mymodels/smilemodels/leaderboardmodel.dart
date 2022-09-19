
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
          name:  "Name 1 : s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"
              " text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a"
              " type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, "
              "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing "
              "Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker "
              "including versions of Lorem Ipsum. since the 1500s, when an unknown printer took a galley of type and scrambled it to make"
              "since the 1500s, when an unknown printer took a galley of type and scrambled it to make"
              "since the 1500s, when an unknown printer took a galley of type and scrambled it to make IT ENDED HERE.",
          count: 10,
          percentage: 60.0,
          avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 2", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 3", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 4", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 5", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 6", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 7", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
      new LeaderBoardModel(name: "Name 8", count: 10, percentage: 60.0, avartar: 'images/imageuser.png'),
    ];
  }
  List<LeaderBoardModel>? get leaderboardlist => _leaderboards;
}
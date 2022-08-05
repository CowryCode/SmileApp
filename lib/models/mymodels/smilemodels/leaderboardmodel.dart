
import 'package:flutter/material.dart';

class LeaderBoardModel{
  String id = UniqueKey().toString();
  String name;
  int count;
  double percentage;
  String avartar;

  LeaderBoardModel.init();
  LeaderBoardModel(this.name, this.count, this.percentage, this.avartar);
  LeaderBoardModel getCurrentLeaderBoardModel(){
    return LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png');
  }
}

class LeaderBoardModelLIST{
  List<LeaderBoardModel> _leaderboards;
  LeaderBoardModelLIST(){
    this._leaderboards = [
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
      new LeaderBoardModel("Name 1", 10, 60.0, 'images/imageuser.png'),
    ];
  }
  List<LeaderBoardModel> get leaderboardlist => _leaderboards;
}
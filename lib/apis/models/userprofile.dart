import 'package:SmileApp/apis/models/leaderboard.dart';
import 'package:SmileApp/apis/models/unreadtribemessages.dart';
import 'package:SmileApp/apis/models/unrepliedtribecalls.dart';

class UserProfile {
  int? id;
  String? name;
  String? phonenumber;
  bool? isconsented;
  double? smilegrampoint;
  double? accumulatedValue;
  String? smilegrammappoints;
  String? deviceId;

  LeaderBoard? leaderBoard;
  UnreadTribeMessage? unreadTribeMessage;
  UnreadTribeMessage? readTribeMessages;
  UnrepliedTribeCalls? unrepliedTribeCalls;

  UserProfile(
      {this.id,
        this.name,
        this.phonenumber,
        this.isconsented,
        this.smilegrampoint,
        this.smilegrammappoints,
        this.deviceId,
        this.leaderBoard,
        this.unreadTribeMessage,
        this.readTribeMessages,
        this.unrepliedTribeCalls,
      });

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    isconsented = json['isconsented'];
    smilegrampoint = json['smilegrampoint'];
    accumulatedValue = json['accumulatedValue'];
    smilegrammappoints = json['smilegrammappoints'];
    deviceId = json['deviceId'];

    leaderBoard = json['leaderBoard'] != null ? new LeaderBoard.fromJson(json['leaderBoard']) : null;
    unreadTribeMessage = json['unreadTribeMessage'] != null ? new UnreadTribeMessage.fromJson(json['unreadTribeMessage']) : null;
    readTribeMessages = json['readTribeMessages'] != null ? new UnreadTribeMessage.fromJson(json['readTribeMessages']) : null;
    unrepliedTribeCalls = json['unrepliedTribeCalls'] != null ? new UnrepliedTribeCalls.fromJson(json['unrepliedTribeCalls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['isconsented'] = this.isconsented;
    data['smilegrampoint'] = this.smilegrampoint;
    data['accumulatedValue'] = this.accumulatedValue;
    data['smilegrammappoints'] = this.smilegrammappoints;
    data['deviceId'] = this.deviceId;

    if (this.leaderBoard != null) {
      data['leaderBoard'] = this.leaderBoard!.toJson();
    }

    if (this.unreadTribeMessage != null) {
      data['unreadTribeMessage'] = this.unreadTribeMessage!.toJson();
    }

    if (this.readTribeMessages != null) {
      data['readTribeMessages'] = this.readTribeMessages!.toJson();
    }

    if (this.unrepliedTribeCalls != null) {
      data['unrepliedTribeCalls'] = this.unrepliedTribeCalls!.toJson();
    }

    return data;
  }
}

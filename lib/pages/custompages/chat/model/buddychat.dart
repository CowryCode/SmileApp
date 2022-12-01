import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:flutter/material.dart';

class BuddyChat {
  String id = UniqueKey().toString();
  String? text;
  String? time;
  bool? isBot;
  BuddyChat.init();
  BuddyChat({required this.text, required this.time,required this.isBot});
  List<BuddyChat> getChat() {
    return [
      new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", time: "32 min ago",isBot: true),
    ];
  }
}

import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:flutter/material.dart';

class BuddyChat {
  String id = UniqueKey().toString();
  String? text;
  bool? isBot;
  // List<BuddyChat> chats = [new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),];
  BuddyChat.init();
  BuddyChat({required this.text, required this.isBot});
  List<BuddyChat> getChat() {
    //return chats;
    return [
      new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),
    ];
  }

  // void updateChats({ required List<BuddyChat> updatedchat}){
  //   this.chats = updatedchat;
  // }
}

import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:flutter/material.dart';

class BuddyChat {
  String id = UniqueKey().toString();
  String? text;
  bool? isBot;
  bool? isPlaceholder;
  // List<BuddyChat> chats = [new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),];
  BuddyChat.init();
  BuddyChat({required this.text, required this.isBot, this.isPlaceholder = false});
  List<BuddyChat> getChat() {
    //return chats;
    return [
      new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),
    ];
  }

  void responseReady({required String botResponse}){
    if(this.isPlaceholder == true){
      this.text = botResponse;
      this.isPlaceholder = false;
    }
  }

  // void updateChats({ required List<BuddyChat> updatedchat}){
  //   this.chats = updatedchat;
  // }
}

import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:flutter/cupertino.dart';

class ChatHistoryValueNotifier extends ValueNotifier<List<BuddyChat>>{
  // List<BuddyChat> chats = [new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),];
  ChatHistoryValueNotifier({List<BuddyChat>? value}) : super(value ??  [new BuddyChat(text: "Hey, How can I help you Do you have any problem?  ", isBot: true),]);

  void updateComment({required String chat, required bool isbot}){
    List<BuddyChat> chathistory = value;
    chathistory.insert(0, new BuddyChat( text:chat , isBot: isbot));
    value = chathistory;
    notifyListeners();
  }

  List<BuddyChat> getChatHistory(){
    return value;
  }
}
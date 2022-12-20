import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:flutter/cupertino.dart';

class ChatHistoryValueNotifier extends ValueNotifier<List<BuddyChat>>{
  ChatHistoryValueNotifier({List<BuddyChat>? value}) : super(value ??  [new BuddyChat(text: "Hey, How are you today? ", isBot: true),]);

  void updateComment({required String chat, required bool isbot}){
    List<BuddyChat> chathistory = value;
    chathistory.insert(0, new BuddyChat( text:chat , isBot: isbot));

    //TODO:
    //chathistory.insert(0, new BuddyChat( text:"I am great and you?" , isBot: true));
    value = chathistory;
    notifyListeners();
  }

  List<BuddyChat> getChatHistory(){
    return value;
  }
}
import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:flutter/cupertino.dart';

class ChatHistoryValueNotifier extends ValueNotifier<List<BuddyChat>>{
  ChatHistoryValueNotifier({List<BuddyChat>? value}) : super(value ??  [new BuddyChat(text: "Hey, How are you today? ", isBot: true),]);

  void updateComment({required String chat, required bool isbot, required bool isPlaceholder}){
    if(isPlaceholder == false && isbot == true){
      value.elementAt(0).responseReady(botResponse: chat);
    }

    // else if(isPlaceholder == false && isbot == false){
    //   // Do Nothing because nothing was returning from the
    // }
    //
    else{
      value.insert(0, new BuddyChat( text:chat , isBot: isbot, isPlaceholder: isPlaceholder));
    }
    notifyListeners();
  }

  List<BuddyChat> getChatHistory(){
    return value;
  }
}
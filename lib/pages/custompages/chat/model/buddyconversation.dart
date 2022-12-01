

import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:SmileApp/pages/custompages/chat/model/chat.dart';

class BuddyConversation{
  String? image;
  String? name;
  List<BuddyChat>? buddychats;
  BuddyConversation.advanced(this.image,this.name,this.buddychats);
  BuddyConversation.basic(this.image,this.name);

}
class BuddyConversationList{
  List<BuddyConversation>? _conversationList;

  BuddyConversationList(){
    this._conversationList =[
      new BuddyConversation.advanced("images/asset-1.png",'Dr.Alina james',new BuddyChat.init().getChat(),),
      new BuddyConversation.advanced("images/asset-6.png",'Dr.Nemeli Aaraf',new BuddyChat.init().getChat(),),
    ];
  }
  List<BuddyConversation> get conversation => _conversationList!;

}
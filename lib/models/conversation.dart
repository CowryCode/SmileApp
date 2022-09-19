import 'package:SmileApp/models/chat.dart';


class Conversation{
 String? image;
 String? name;
 List<Chat>? chats;
 Conversation.advanced({this.image,this.name,this.chats});
 Conversation.basic({this.image,this.name});

}
class ConversationList{
  List<Conversation>? _conversationList;

  ConversationList(){
    this._conversationList =[
      new Conversation.advanced(image: "images/asset-1.png",name: 'Dr.Alina james',chats: new Chat.init().getChat(),),
    ];
  }
  List<Conversation>? get conversation => _conversationList;

}
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:SmileApp/models/chat.dart';
import 'package:SmileApp/models/conversation.dart';
import 'package:SmileApp/models/doctor.dart';
import 'package:SmileApp/models/user.dart';
import 'package:SmileApp/widgets/chatWidget.dart';


class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  ConversationList _conversationList = new ConversationList();
  User _currentUser = new User.init().getCurrentUser();
  Doctor _currentDoctor =new Doctor.init().getCurrentDoctor();
  final _myListKey = GlobalKey<AnimatedListState>();
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight: Radius.circular(16.0)),
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          _currentDoctor.name,
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: AnimatedList(
                key: _myListKey,
                reverse: true,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                initialItemCount: _conversationList.conversation[0].chats.length,
                itemBuilder: (context, index, Animation<double> animation) {
                  Chat chat = _conversationList.conversation[0].chats[index];
                  return ChatMessageListItem(
                    chat: chat,
                    animation: animation,
                  );
                },
              ),
            ),
            // Expanded(
            //   //  child: ListView.builder(
            //     child: ListView.builder(
            //       itemCount: messages.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.vertical,
            //       padding: EdgeInsets.only(top: 10,bottom: 10),
            //       physics: NeverScrollableScrollPhysics(),
            //       itemBuilder: (context, index){
            //         return Container(
            //           decoration: BoxDecoration(
            //             // color: Colors.grey.withOpacity(0.2),
            //               color: messages[index].messageType == "receiver"? Theme.of(context).colorScheme.secondary :Theme.of(context).primaryColor ,
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(16), bottomLeft: Radius.circular(16), topRight: Radius.circular(16))),
            //           padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //           child: Align(
            //             alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
            //             child: messages[index].messageType == "receiver"?
            //             getReceivedMessageLayout(messages[index].name,messages[index].messageContent,messages[index].messageType,messages[index].userAverta)
            //                 : getSentMessageLayout(messages[index].name,messages[index].messageContent,messages[index].messageType,messages[index].userAverta),
            //           ),
            //         );
            //       },
            //     ),
            // ),
            Container(
                margin: const EdgeInsets.only(bottom: 12.0,right: 6.0,left: 6.0),
                decoration: BoxDecoration(
                border: Border.all(width: 1.0,color: Colors.grey.withOpacity(0.6)),
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  // BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0,-4), blurRadius: 10)
                ],
              ),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10,bottom: 10),
                  hintText: 'Message ...',
                  hintStyle: TextStyle(color: Colors.grey,fontFamily: 'Poppins'),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 30),
                    onPressed: () {
                      bool random = Random().nextBool(); // I used this to simulate chat alternations between two people
                      String messageType = random ? "Sent" : "Recieved";

                      setState(() {
                        _conversationList.conversation[0].chats
                            .insert(0, new Chat(myController.text,'21min ago', _currentUser, messageType));
                        _myListKey.currentState.insertItem(0);

                      });
                      Timer(Duration(milliseconds: 100), () {
                        myController.clear();
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).accentColor,
                      size: 25,
                    ),
                  ),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
             )
          ]
      )
    );


  }
  Widget getSentMessageLayout1(@required String name, @required String messageContent, @required StringmessageType, @required String userAverta) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16), topRight: Radius.circular(16))),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(messageContent,style: TextStyle(fontFamily: 'Poppins', color: Theme.of(context).primaryColor,),),
                  ),
                ],
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: new CircleAvatar(
                      backgroundImage: AssetImage(userAverta),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getReceivedMessageLayout1(@required String name, @required String messageContent, @required StringmessageType, @required String userAverta) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.8),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: new CircleAvatar(
                    backgroundImage: AssetImage(userAverta),
                  ),
                )
              ],
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      messageContent,
                      style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

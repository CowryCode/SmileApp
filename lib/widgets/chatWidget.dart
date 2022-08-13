
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:SmileApp/models/chat.dart';
import 'package:SmileApp/models/doctor.dart';
import 'package:SmileApp/models/user.dart';

class ChatMessageListItem extends StatelessWidget {
  final Chat chat;
  final User currentUser = new User.init().getCurrentUser();
  final Doctor currentDoctor = new Doctor.init().getCurrentDoctor();

  final Animation animation;

ChatMessageListItem({this.chat, this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child:
       //  currentUser.name == this.chat.user.name ? getSentMessageLayout(context) : getReceivedMessageLayout(context), // Original
         chat.messageType == "Sent" ? getSentMessageLayout(context) : getReceivedMessageLayout(context),
    );
  }

  Widget getSentMessageLayout(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          //  color: Colors.grey.withOpacity(0.2),
            color: Colors.grey.withOpacity(0.8),
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
                 new Text(this.chat.user.name, style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(chat.text,style: TextStyle(fontFamily: 'Poppins',),),
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
                      backgroundImage: AssetImage(this.chat.user.avatar),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getReceivedMessageLayout(context) {
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
                      backgroundImage: AssetImage(currentDoctor.avatar),
                    ),
                  )
              ],
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("SmileBot", style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      chat.text,
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

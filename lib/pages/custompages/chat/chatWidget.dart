
import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:SmileApp/pages/custompages/chat/model/chat.dart';
import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  //final Chat chat;
  final BuddyChat chat;
  final User currentUser = new User.init().getCurrentUser();
  final Doctor currentDoctor = new Doctor.init().getCurrentDoctor();

  final Animation<double> animation;

  ChatMessageListItem({required this.chat, required this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child:
        //  currentUser.name == this.chat.user!.name ? getSentMessageLayout(context) : getReceivedMessageLayout(context),
         this.chat.isBot == true ? getReceivedMessageLayout(context) : getSentMessageLayout(context) ,
    );
  }

  Widget getSentMessageLayout(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
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
                //  new Text(this.chat.user!.name!, style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),),
                  new Text('You', style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(chat.text!,style: TextStyle(fontFamily: 'Poppins',color: Colors.black,),),
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
                      backgroundColor: Theme.of(context).primaryColor,
                      //backgroundImage: AssetImage(this.chat.user!.avatar!),
                     child: Text("SA", style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold)),
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
                      //backgroundImage: AssetImage(currentDoctor.avatar!),
                      backgroundImage: AssetImage('assets/logo1.jpeg'),
                    ),
                  )
              ],
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 // new Text(currentDoctor.name!, style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                  new Text('AI Buddy', style: TextStyle(fontFamily: 'Poppins',color: Colors.yellowAccent,fontWeight: FontWeight.bold),),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(chat.text!,  style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor),),
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

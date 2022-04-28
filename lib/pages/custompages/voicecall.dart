import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medico/models/chat.dart';
import 'package:medico/models/conversation.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';
import 'package:medico/widgets/chatWidget.dart';

class VioceCallWidget extends StatefulWidget {
  @override
  _VoiceCallWidgetState createState() => _VoiceCallWidgetState();
}

class _VoiceCallWidgetState extends State<VioceCallWidget> {
  ConversationList _conversationList = new ConversationList();
  User _currentUser = new User.init().getCurrentUser();
  Doctor _currentDoctor = new Doctor.init().getCurrentDoctor();
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
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
           _currentDoctor.name,
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // My code
          Container(
              padding: const EdgeInsets.all(0.0),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                      // color: Theme.of(context).colorScheme.secondary,
                      decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))),
                      child: IconButton(
                        iconSize: 60.0,
                        icon: const Icon(Icons.call),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                    ),
                  ])),

          Container(
              padding: const EdgeInsets.all(0.0),
              width: MediaQuery.of(context).size.width * 0.8 ,
              height: MediaQuery.of(context).size.height * 0.2,
              alignment: Alignment.center,
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        callActions(Colors.green),
                        callActions(Colors.red),
                      ],
                    ),
                  ),
          // My code

        ],
      ),
    ),
    );
  }

  Widget callActions(Color newcolor) {
   return Container(
     width: MediaQuery.of(context).size.width * 0.2,
     height: MediaQuery.of(context).size.width * 0.2,
     // color: Colors.amberAccent,
     decoration: BoxDecoration(
         // color: Colors.indigo.withOpacity(0.2),
         color: newcolor,
         borderRadius:
         BorderRadius.all(Radius.circular(100.0))),
     child: IconButton(
       iconSize: 60.0,
       icon: const Icon(Icons.call),
       // color: Theme.of(context).primaryColor,
       color: Theme.of(context).primaryColor,
       onPressed: () {},
     ),
   );
  }

}

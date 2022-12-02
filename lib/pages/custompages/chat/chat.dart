import 'dart:async';
import 'dart:math';
import 'package:SmileApp/pages/custompages/chat/chatWidget.dart';
import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:SmileApp/pages/custompages/chat/model/buddyconversation.dart';
import 'package:SmileApp/pages/custompages/chat/model/chat.dart';
import 'package:SmileApp/pages/custompages/chat/model/conversation.dart';
import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:SmileApp/statemanagement/notifiers/chatnotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  //ConversationList _conversationList = new ConversationList();
  BuddyConversationList _buddyconversationList = new BuddyConversationList();
  User _currentUser = new User.init().getCurrentUser();
  Doctor _currentDoctor = new Doctor.init().getCurrentDoctor();
  final _myListKey = GlobalKey<AnimatedListState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                // set to false if you want to force a rating
                builder: (context) => _showRatingAlert(context),
              );
              // Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0)),
          ),
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            "Baby AI Speaks!",
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Poppins',
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: chatcentralnotifier,
                builder: (context, List<BuddyChat> value, child) {
                  return AnimatedList(
                    key: _myListKey,
                    reverse: true,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    initialItemCount: value.length,
                    // Latest
                    itemBuilder: (context, index, Animation<double> animation) {
                      return ChatMessageListItem(
                       // chat: _buddyconversationList.conversation[0].buddychats![index],
                        chat: value[index],
                        animation: animation,
                      );
                    },
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12.0, right: 6.0, left: 6.0),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1.0, color: Colors.grey.withOpacity(0.6)),
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                // BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0,-4), blurRadius: 10)
              ],
            ),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10, bottom: 10),
                hintText: 'Message ...',
                hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 30),
                  onPressed: () {
                    chatcentralnotifier.updateComment(
                        chat: myController.text, isbot: false);
                    setState(() {
                      _myListKey.currentState!.insertItem(0);
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
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          )
        ]));
  }

  Widget _getSentMessageLayout1(
      @required String name,
      @required String messageContent,
      @required StringmessageType,
      @required String userAverta) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                topRight: Radius.circular(16))),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      messageContent,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
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

  Widget _getReceivedMessageLayout1(
      @required String name,
      @required String messageContent,
      @required StringmessageType,
      @required String userAverta) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.8),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
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
                  new Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      messageContent,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor),
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

  RatingDialog _showRatingAlert(BuildContext context) {
    return RatingDialog(
      showCloseButton: false,
      starSize: 30.0,
      initialRating: 0.0,
      // your app's name?
      title: Text(
        'Rate Your Mood',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'How do you feel chatting with the bot?',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // // your app's logo?
      //image: const FlutterLogo(size: 100),
      image: Image.asset(
        "assets/logo1.jpeg",
        width: 100,
        height: 100,
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        //TODO: REMOVE THIS ON PRODUCTION
        chatcentralnotifier.updateComment(
            chat: "I respond as a bot", isbot: true);
        Navigator.of(context).popAndPushNamed(
          '/home',
        );
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.green),
    );
  }
}

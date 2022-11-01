import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data.containsKey('data')) {
    // Handle data message
    final data = message.data['data'];
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final notification = message.data['notification'];
  }
  // Or do other work.
}


class FCM  {

  final _firebaseMessaging = FirebaseMessaging.instance;

  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      FirebaseMessaging.onMessage.listen(
            (message) async {
        if (message.data.containsKey('data')) {
            // Handle data message
          streamCtlr.sink.add(message.data['data']);
          }
          if (message.data.containsKey('notification')) {
            // Handle notification message
            streamCtlr.sink.add(message.data['notification']);
          }
          // Or do other work.
          // titleCtlr.sink.add(message.notification!.title!);
          // bodyCtlr.sink.add(message.notification!.body!);
          String msg;
          String tittle;
          if (message != null) {
            if (message.notification != null) {
              print(message.notification.toString());
              if (message.notification!.title != null) {
                tittle = message.notification!.title!;
              } else {
                tittle = "message.notification.title is null";
              }
              if (message.notification!.body != null) {
                msg = message.notification!.body!;
              } else {
                msg = "message.notification.body is null";
              }
            } else {
              msg = "message.notification is null";
              tittle = "Tittle1";
            }
          } else {
            print("Message is null");
            msg = "No Message";
            tittle = "Tittle1";
          }
          print("The message is ${msg}");
          print(" The title is ${tittle}");

          String notificationTitle = message.notification!.title?? "No Title";
          String notificationBody = message.notification!.body?? "No Body";
          titleCtlr.sink.add(notificationTitle);
          bodyCtlr.sink.add(notificationBody);
        },
      );

  }

  dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }


}
import 'package:flutter/material.dart';
import 'package:SmileApp/models/mymodels/user.dart';

class Chat {
  String? id = UniqueKey().toString();
  String? text;
  String? time;
  String? messageType;  // Sent or Recieved
  User? user;
  //Doctor doctor = new Doctor.init().getCurrentDoctor();
  User _currentUser = new User.advanced(name: "Dr.Alina james",gender: 'Male', dateOfBirth: DateTime(1993, 12, 31),avatar: 'images/asset-1.png',phoneNumber: "213796113384");
  Chat.init();
  Chat(this.text, this.time, this.user, this.messageType);
  List<Chat> getChat() {
    return [
      new Chat("Hey, How are you today? ", "32 min ago", _currentUser, "Recieved"),
    ];
  }
}

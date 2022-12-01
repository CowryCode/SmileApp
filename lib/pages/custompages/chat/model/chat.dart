import 'package:SmileApp/pages/custompages/chat/model/doctor.dart';
import 'package:SmileApp/pages/custompages/chat/model/user.dart';
import 'package:flutter/material.dart';

class Chat {
  String id = UniqueKey().toString();
  String? text;
  String? time;
  User? user;
  Doctor doctor = new Doctor.init().getCurrentDoctor();
  User _currentUser = new User.advanced("Dr.Alina james",'Male', DateTime(1993, 12, 31),'images/asset-1.png',"213796113384");
  Chat.init();
  Chat(this.text, this.time, this.user);
  List<Chat> getChat() {
    return [
      new Chat("Hey, How can I help you Do you have any problem?  ", "32 min ago",_currentUser),
    ];
  }
}

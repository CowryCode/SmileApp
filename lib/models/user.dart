import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' show DateFormat;

class User {
  String? id = UniqueKey().toString();
  String? name;
  String? phoneNumber;
  String? gender;
  DateTime? dateOfBirth;
  String? avatar;

  User.init();

  User.basic({this.name, this.phoneNumber});

  User.advanced({this.name, this.gender, this.dateOfBirth, this.avatar,this.phoneNumber});

  User getCurrentUser() {
    return User.advanced(name: 'Joseph Orji', gender: 'Male', dateOfBirth: DateTime(1993, 12, 31), avatar: 'images/imageuser.png',phoneNumber: "494899650012");
  }

  getDateOfBirth() {
    return DateFormat('yyyy-MM-dd').format(this.dateOfBirth!);
  }
}



import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:flutter/material.dart';

class UserProfileNotifier extends ValueNotifier<UserProfile> {
  UserProfileNotifier({required UserProfile value}) : super(value);

  void updateUserProfileNotifier({required UserProfile userProfile}) {
    value = userProfile;
    notifyListeners();
  }

  UserProfile getUserProfile(){
    return value;
  }
}
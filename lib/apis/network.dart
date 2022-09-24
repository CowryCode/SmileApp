import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:http/http.dart' as http;

import 'package:redux/redux.dart';

class ApiAccess {

  Future<UserProfile?> createprofile({required UserProfile profile}) async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_phone_number);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(CreateProfile_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "id" : profile.id,
            "name" : profile.name,
            "phonenumber" : profile.phonenumber,
            "isconsented" : profile.isconsented,
            "smilegrampoint" : profile.smilegrampoint,
            "deviceId" : profile.deviceId,
          }),
    );

    if (response.statusCode == 200) {
      UserProfile profile = UserProfile.fromJson(jsonDecode(response.body));
      return profile;
    } else {
      return null;
    }
  }


  Future<UserProfile> loginWithPhoneNumber({required String phonenumber}) async {
    // String? token;
    // Future<String?> tk = Localstorage().getString(key_login_token);
    // await tk.then((value) => {token = value!});

    try {
      final response = await http.get(Uri.parse(getProfile_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $phonenumber'
        },
      );

      if (response.statusCode == 200) {
        UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
        Localstorage().saveString(key_login_token, phonenumber);
        print(userProfile.toJson());
        return userProfile;
      } else {
        throw Exception("Could not pull user record, status code ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception("User Profile error, status code ${e.toString()}");
    }
 }

 // Future<bool> uploadDeviceIdentifier({required String token}) async {

    // String logintoken = await Localstorage().getString(key_login_token)??"";
    //
    //
    // final response = await http.post(
    //   Uri.parse(submitDeviceIdentifier_URL),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Accept': 'application/json',
    //     'Origin': '$MobileURL',
    //     'Authorization': 'Bearer $logintoken'
    //   },
    //   body: jsonEncode(
    //       <String, String?>{"code": token}),
    // );
    //
    // if (response.statusCode == 201) {
    //   print("Successfully saved");
    //   return true;
    // }else{
    //   return false;
    // }
  //}

}


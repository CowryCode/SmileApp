import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/models/leaderboard.dart';
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/models/mymodels/leaderboardmodel.dart';
import 'package:http/http.dart' as http;

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


  Future<UserProfile> loginWithPhoneNumber({String? phonenumber}) async {
    try {
    String? token;

    if(phonenumber == null){
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
    }else{
      token = phonenumber;
    }

      final response = await http.get(Uri.parse(getProfile_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
        if(phonenumber != null){
          Localstorage().saveString(key_login_token, phonenumber);
        }
        print('USES PROFILE ${userProfile.toJson()}');
        return userProfile;
      } else {
        throw Exception("Could not pull user record, status code ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception("User Profile error, status code ${e.toString()}");
    }
 }

  Future<TribeMessage?> sendTribeMessage({required TribeMessage message}) async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(Tribe_Message_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "id" : message.id,
            "content" : message.content,
            "numberoflikes" : message.numberoflikes,
            "isread" : message.isread,
          }),
    );

    if (response.statusCode == 200) {
      TribeMessage msg = TribeMessage.fromJson(jsonDecode(response.body));
      return msg;
    } else {
      return null;
    }
  }

  void saveMood({required MoodModel moodModel, required String url}) async {
    String? token = "100";
    //TODO: REVERT THIS TO BE DYNAMIC
    // String? token;
    // Future<String?> tk = Localstorage().getString(key_login_token);
    // await tk.then((value) => {token = value!});
    print("URL : $url");
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "startDate" : moodModel.startDate,
            "startTime" : moodModel.startTime,
            "startMood" : moodModel.startMood,
            "endDate" : moodModel.endDate,
            "endTime" : moodModel.endTime,
            "endMood" : moodModel.endMood,
            "smileduration" : moodModel.smileduration,
          }),
    );

  }

  Future<LeaderBoard?> getLeaderBoard() async {
    try {
      String? token = "100";
      //TODO: REVERT THIS TO BE DYNAMIC
      // String? token;
      // Future<String?> tk = Localstorage().getString(key_login_token);
      // await tk.then((value) => {token = value!});

      final response = await http.get(Uri.parse(Leader_Board_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        LeaderBoard lb = LeaderBoard.fromJson(jsonDecode(response.body));
        print("The LeaderBoard : ${lb.toJson()}");
        return lb;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("User Profile error, status code ${e.toString()}");
    }
  }
}


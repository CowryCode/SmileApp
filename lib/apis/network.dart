import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/models/chatbotPodo.dart';
import 'package:SmileApp/apis/models/globalprogressmodel.dart';
import 'package:SmileApp/apis/models/leaderboard.dart';
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/models/personalprogressmodel.dart';
import 'package:SmileApp/apis/models/questionnaireBMIScale.dart';
import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/apis/models/triberequest.dart';
import 'package:SmileApp/apis/models/unreadtribemessages.dart';
import 'package:SmileApp/apis/models/unrepliedtribecalls.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/apis/secret.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
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
            "smilegrampoint" : profile.smilegrampoints,
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


  Future<UserProfile> login({required String logincode}) async {
    print('LOGIN GOT HERE 1');
    print('URL IS : $getProfile_URL');
    try {
      final response = await http.get(Uri.parse(getProfile_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $logincode'
        },
      );

      if (response.statusCode == 200) {
        print('LOGIN GOT HERE 2');
        UserProfile profile = UserProfile.fromJson(jsonDecode(response.body));
        // UPDATE USERPROFILE NOTIFIER
        userProfileNotifier.updateUserProfileNotifier(userProfile: profile);

        smileAppValueNotifier.updateCountriesIndexString(countriesIndex: profile.smilegrammappoints!,nextID: 0);

        //LEADER BOARD
        LeaderBoard? lb = profile.leaderBoard;
        if(lb != null) _populateProgressTable(progress: lb.personalProgresses!);
        if(lb != null) _populateGlobalLeaderBoard(gloableranking: lb.globalProgresses!);

        // SMILE PACK
        UnreadTribeMessage? unreadsmilePacks = profile.unreadTribeMessage;
        if(unreadsmilePacks != null) tribeMessagesNotifier.updateTribeMessageList(requestlist: unreadsmilePacks.messages!);

        // READ SMILE PACKS
        UnreadTribeMessage? readsmilePacks = profile.readTribeMessages;
        if(readsmilePacks != null) readtribeMessageNotifier.updateMessageList(requestlist: readsmilePacks.messages!);

        // UNREPLIED TRIBE CALL
        UnrepliedTribeCalls? unrepliedTribecalls = profile.unrepliedTribeCalls;
        if(unrepliedTribecalls != null) tribeEmpathyRequestNotifier.updateEmpathyRequests(update: unrepliedTribecalls.msgcalls!);

        // UPDATE USERPROFILE NOTIFIER
        userProfileNotifier.updateUserProfileNotifier(userProfile: profile);

        // UPDATE NUMBER OF COUNTRIES PAINTED
        smileGameNofitier.setTodayScore(countryCount: profile.todayAchievedValue!);

        Localstorage().saveString(key_login_token, logincode);
        Localstorage().saveBoolean(key_login_status, true);
        return profile;
      } else {
         throw Exception("`Couldn't pull the profile ");
      }
    } catch (e) {
       throw Exception("Error, status code ${e.toString()}");
    }
 }


  Future<UserProfile> refreshData() async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    try {
      final response = await http.get(Uri.parse(getProfile_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        UserProfile profile = UserProfile.fromJson(jsonDecode(response.body));
        // if (profile != null )  print('Profile Detail : ${profile.toJson()}');
        smileAppValueNotifier.updateCountriesIndexString(countriesIndex: profile.smilegrammappoints!,nextID: 0);

        //LEADER BOARD
        LeaderBoard? lb = profile.leaderBoard;
        if(lb != null) _populateProgressTable(progress: lb.personalProgresses!);
        if(lb != null) _populateGlobalLeaderBoard(gloableranking: lb.globalProgresses!);

        // SMILE PACK
        UnreadTribeMessage? unreadsmilePacks = profile.unreadTribeMessage;
        if(unreadsmilePacks != null) tribeMessagesNotifier.updateTribeMessageList(requestlist: unreadsmilePacks.messages!);

        // READ SMILE PACKS
        UnreadTribeMessage? readsmilePacks = profile.readTribeMessages;
        if(readsmilePacks != null) readtribeMessageNotifier.updateMessageList(requestlist: readsmilePacks.messages!);

        // UNREPLIED TRIBE CALL
        UnrepliedTribeCalls? unrepliedTribecalls = profile.unrepliedTribeCalls;
        if(unrepliedTribecalls != null) tribeEmpathyRequestNotifier.updateEmpathyRequests(update: unrepliedTribecalls.msgcalls!);

        // UPDATE USERPROFILE NOTIFIER
        userProfileNotifier.updateUserProfileNotifier(userProfile: profile);

        // UPDATE NUMBER OF COUNTRIES PAINTED
        smileGameNofitier.setTodayScore(countryCount: profile.todayAchievedValue!);

        return profile;
      } else {
        throw Exception("`Couldn't pull the profile ");
      }
    } catch (e) {
      throw Exception("Error, status code ${e.toString()}");
    }
  }



  void Logout() async{
    Localstorage().saveBoolean(key_login_status, false);
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
            // "id" : message.id,
            // "content" : message.content,
            // "numberoflikes" : message.numberoflikes,
            // "isread" : message.isread,
          }),
    );

    if (response.statusCode == 200) {
      TribeMessage msg = TribeMessage.fromJson(jsonDecode(response.body));
      return msg;
    } else {
      return null;
    }
  }

  Future<bool> uploadDeviceIdentifier({required String deviceID}) async {
    // String token = "100";
    // Future<String?> tk = Localstorage().getString(key_Device_Identifier);
    // await tk.then((value) => {identifier = value});

   String token = await Localstorage().getString(key_login_token)??"";


    final response = await http.post(
      Uri.parse(Save_Device_Identtifier_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, String?>{"value": deviceID}),
    );

    if (response.statusCode == 201) {
      return true;
    }else{
      return false;
    }
  }

  void saveMood({required MoodModel moodModel, required String url}) async {
    try{
      print('THE RECORDED START : ${moodModel.startMood}');
      print('THE RECORDED END : ${moodModel.endMood }');
      if(moodModel.startMood == null || moodModel.endMood == null) return;
      String? token;
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
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
              "countrycount" : moodModel.countrycount,
            }),
      );

      if (response.statusCode == 200) {
        MoodModel svdMood = MoodModel.fromJson(jsonDecode(response.body));
        print('THE RECORDED SMILE DURATION ${svdMood.toJson()}');
        smileAppValueNotifier.resetMoodObject(savedmood: svdMood);
        smileGameNofitier.resetGameVariables();
        refreshData(); // Just implemented while pilot was going on
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  Future<LeaderBoard?> getLeaderBoard() async {
    try {
      String? token;
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
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
        _populateProgressTable(progress: lb.personalProgresses!);
        _populateGlobalLeaderBoard(gloableranking: lb.globalProgresses!);
        return lb;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("User Profile error, status code ${e.toString()}");
    }
  }

  void _populateProgressTable({required List<PersonalProgresses> progress}){
    List<PersonalProgresses> currentTable = progressTable.value;
    for(int i = 0; i < progress.length; i++ ){
      currentTable[i].setScore(score: progress[i].scoredValue!);
    }
    progressTable.updateScoreTable(table: currentTable);
  }

  void _populateGlobalLeaderBoard({required List<GlobalProgresses> gloableranking}){
    globalscoresTable.updateScoreRanking(globalscores: gloableranking);
    // int x = globalscoresTable.value.length;
  }


  Future<UnreadTribeMessage?> readTribeMessage({required int messageID}) async {
   // String token = "100";
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(Read_A_SmilePack_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "id" : messageID,
            "isread" : true,
          }),
    );

    if (response.statusCode == 200) {
      UnreadTribeMessage msges = UnreadTribeMessage.fromJson(jsonDecode(response.body));
      tribeMessagesNotifier.updateTribeMessageList(requestlist: msges.messages!);
      return msges;
    } else {
      return null;
    }
  }

  Future<UnreadTribeMessage?> getSmilePacks() async {
    try {
     // String? token = "100";
      String? token;
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
      final response = await http.get(Uri.parse(Unread_SmilePacks_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        UnreadTribeMessage msges = UnreadTribeMessage.fromJson(jsonDecode(response.body));
        tribeMessagesNotifier.updateTribeMessageList(requestlist: msges.messages!);
        getAllReadSmilePacks();
        return msges;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error, status code ${e.toString()}");
    }
  }

  Future<UnreadTribeMessage?> getAllReadSmilePacks() async {
    print('GET A');
    try {
     // String? token = "100";
      String? token;
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
      final response = await http.get(Uri.parse(ALL_Read_SmilePacks_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        UnreadTribeMessage msges = UnreadTribeMessage.fromJson(jsonDecode(response.body));
        readtribeMessageNotifier.updateMessageList(requestlist: msges.messages!);
        return msges;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error, status code ${e.toString()}");
    }
  }

  Future<UnrepliedTribeCalls?> getUnrepliedTribeCalls() async {
    try {
    // String? token = "101";
      String? token;
      Future<String?> tk = Localstorage().getString(key_login_token);
      await tk.then((value) => {token = value!});
      final response = await http.get(Uri.parse(Unreplied_Requests_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Origin': '$MobileURL',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        UnrepliedTribeCalls msges = UnrepliedTribeCalls.fromJson(jsonDecode(response.body));
        tribeEmpathyRequestNotifier.updateEmpathyRequests(update: msges.msgcalls!);
        return msges;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error, status code ${e.toString()}");
    }
  }

  Future<bool?> requestEmpatheticMessage({required String emotions}) async {
    print(" Hi, someone is $emotions. Please reply with an empathic message to encourage this person");
    //String? token = "100";
    String location = "Anonymous";
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(Empathy_Request_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "senderID" : token,
            "content" : " Hi, someone is $emotions. Please reply with an empathic message to encourage this person",
            "sourceCountry" : location,
            "responded" : false,
          }),
    );

    if (response.statusCode == 200) {
     // TribeMessage msg = TribeMessage.fromJson(jsonDecode(response.body));
      return true;
    } else {
      return null;
    }
  }


  Future<UnrepliedTribeCalls?> replyTribeCall({required TribeRequest tribeRequest, required String reply}) async {
  //  String? token = "101";
    //TODO: PICK THIS LOCATION AUTOMATICALLY
    String location = "Anonymous";
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(Reply_Requests_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "id" : tribeRequest.id,
            "senderID" : tribeRequest.senderID,
            "receiverID" : token,
            "content" : reply,
            "sourceCountry" : location,
            "responded" : tribeRequest.responded,
          }),
    );

    if (response.statusCode == 200) {
      UnrepliedTribeCalls msges = UnrepliedTribeCalls.fromJson(jsonDecode(response.body));
      tribeEmpathyRequestNotifier.updateEmpathyRequests(update: msges.msgcalls!);
      //TribeMessage msg = TribeMessage.fromJson(jsonDecode(response.body));
      return msges;
    } else {
      return null;
    }
  }

  Future<bool?> sendChat({required String chat}) async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    String chatcontent = "";
    List<String> chatarray = chat.split(" ");

    if(chatarray.length < 2){
      chatcontent = "I am $chat";
    }else{
      chatcontent = chat;
    }

    final response = await http.post(Uri.parse("$chaturl"),
   // final response = await http.post(Uri.parse("https://api.openai.com/v1/completions"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $chatapi'
      },
      body: jsonEncode(
          <String, dynamic>{
            "model" : "text-davinci-003",
            "prompt" : chatcontent,
            "max_tokens" : 1000,
            "temperature" : 1.0,
          }),
    );

    if (response.statusCode == 200) {
      chatbotPODO botmessage = chatbotPODO.fromJson(jsonDecode(response.body));
     //chatcentralnotifier.updateComment(chat: response.body, isbot: true, isPlaceholder: false);
      String chat = botmessage.choices![0].text!.trim();
      chatcentralnotifier.updateComment(chat: '$chat', isbot: true, isPlaceholder: false);
      return true;
    } else {
      return null;
    }
  }


  void saveQuestionnaire({required QuesionnaireBMIScale questionnaire}) async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});

    final response = await http.post(
      Uri.parse(Save_Questionnaire_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Origin': '$MobileURL',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
          <String, dynamic>{
            "lively" : questionnaire.lively,
            "happy" : questionnaire.happy,
            "sad" : questionnaire.sad,
            "tired" : questionnaire.tired,
            "caring" : questionnaire.caring,
            "content" : questionnaire.content,
            "gloomy" : questionnaire.gloomy,
            "jittery" : questionnaire.jittery,
            "drowsy" : questionnaire.drowsy,
            "grouchy" : questionnaire.grouchy,
            "peppy" : questionnaire.peppy,
            "nervous" : questionnaire.nervous,
            "calm" : questionnaire.calm,
            "loving" : questionnaire.loving,
            "fedup" : questionnaire.fedup,
            "active" : questionnaire.active,
          }),
    );

    if (response.statusCode == 200) {
     // QuesionnaireBMIScale savedQuestionnaire = QuesionnaireBMIScale.fromJson(jsonDecode(response.body));
    }
  }

  bool hasPayLoad(){
   int? payloadTester =  userProfileNotifier.value.todayTargetValue;
   return payloadTester != null;
  }
}


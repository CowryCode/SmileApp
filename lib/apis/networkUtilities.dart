import 'package:SmileApp/models/globemodel.dart';

final baseURL = "http://smileapp.ca-central-1.elasticbeanstalk.com";
//final baseURL = "http://192.168.4.47:8080";
// final baseURL = "http://10.0.2.2:8080";
final MobileURL = "https://com.cowrycode.smileapp";

 final SmileGram_Mood_URL = "${baseURL}/smile/smilegram-mood";
 final PocketBuddy_Mood_URL = "${baseURL}/smile/pocketbuddy-mood";
 final Tribe_Mood_URL = "${baseURL}/smile/tribe-mood";
 final Tribe_Message_URL = "${baseURL}/smile/tribemessage";
 final Leader_Board_URL = "${baseURL}/smile/leaderboard";
 final Unread_SmilePacks_URL = "${baseURL}/smile/get-tribemessages";
 final ALL_Read_SmilePacks_URL = "${baseURL}/smile/get-read-tribemessages";
 final Read_A_SmilePack_URL = "${baseURL}/smile/read-message";
 final Empathy_Request_URL = "${baseURL}/smile/empathyrequest";
 final Unreplied_Requests_URL = "${baseURL}/smile/get-pending-requests";
 final Reply_Requests_URL = "${baseURL}/smile/sendTribemessage";
 final Save_Questionnaire_URL = "${baseURL}/smile/savequestionnaire";

 final CreateProfile_URL = "${baseURL}/smile/create-user";
 final getProfile_URL = "${baseURL}/smile/get-user";
 final Save_Device_Identtifier_URL = "${baseURL}/smile/add-device";

 final CHAT_URL = "${baseURL}/smile/chat";

// GLOBAL VIARIABLES for the game
 final int timeout_duration = 10;
 final String key_phone_number = "phonenumber";
 final String key_login_token = "token";
 final String key_login_status = "loginstatus";

 // NOTIFIER VARIABLES
 final int Smile_Count_Initial = 45; // 20 counts = 5 Seconds
 final int Speech_Activation_Count = 20; //formerly 8
 final int Target_Countries_COUNT = 12;
 final int Smile_AlertFeedBack_CountryCount_Interval = 4;

 //SMILE GAME: DISTANCE BETWEEN TARGET AND MOVING OBJECT
final double TargetObjectHorrizontalInitializer = 152;
//SMILE GAME: DISTANCE BETWEEN TARGET AND MOVING OBJECT
final double TargetObjectDistance = 100;
//SMILE GAME: MAXIMUM POSITION FROM THE LEFT FOR ALL OBJECTS
final double MaximumHorrizontalLocation = 300;
//SMILE GAME: MINIMUM POSITION FROM THE LEFT FOR ALL OBJECTS
final double MinimumLocation = 0.0;
//SMILE GAME: MAXIMUM POSITION FROM THE TOP FOR ALL OBJECTS
final int MaximumVerticalLocation = 170;

//SMILE GAME: NUMBER OF COUNTRIES TO PAINT BEFORE POP-UP
final int COUNTRIES_BEFORE_POPUP = 3;

// DURATION IN SECONDS BEFORE BMI POP UP
final double DURATION_BEFORE_BMI_POPUP = 120;




// WORLD MAP Json
 final GlobeModel worldmapModel = GlobeModel();



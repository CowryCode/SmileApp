import 'package:SmileApp/models/globemodel.dart';

 final baseURL = "http://192.168.4.31:8080";
 final MobileURL = "https://com.cowrycode.healthensuite";

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

 final CreateProfile_URL = "${baseURL}/smile/create-user";
 final getProfile_URL = "${baseURL}/smile/get-user";
 final Save_Device_Identtifier_URL = "${baseURL}/smile/add-device";

// GLOBAL VIARIABLES
 final int timeout_duration = 10;
 final String key_phone_number = "phonenumber";
 final String key_login_token = "token";
 final String key_login_status = "loginstatus";

 // NOTIFIER VARIABLES
 final int Smile_Count_Initial = 20; // 20 counts = 5 Seconds
 final int Speech_Activation_Count = 8;
 final int Target_Countries_COUNT = 12;

 //SMILE GAME: DISTANCE BETWEEN TARGET AND MOVING OBJECT
final double TargetObjectDistance = 50;
//SMILE GAME: MAXIMUM POSITION FROM THE LEFT FOR ALL OBJECTS
final double MaximumHorrizontalLocation = 300;
//SMILE GAME: MINIMUM POSITION FROM THE LEFT FOR ALL OBJECTS
final double MinimumHorrizontalLocation = 0.0;



// WORLD MAP Json
 final GlobeModel worldmapModel = GlobeModel();



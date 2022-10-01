//final baseURL = "http://192.168.4.31:8080";
import 'package:SmileApp/apis/models/globemodel.dart';

final baseURL = "http://192.168.2.180:8080";
final MobileURL = "https://com.cowrycode.healthensuite";

final CreateProfile_URL = "${baseURL}/smile/create-user";
final getProfile_URL = "${baseURL}/smile/get-user";

// GLOBAL VIARIABLES
 final int timeout_duration = 10;
 final String key_phone_number = "phonenumber";
 final String key_login_token = "token";
 final String key_login_status = "loginstatus";


 // NOTIFIER VARIABLES
final int Smile_Count_Initial = 10;
// WORLD MAP Json
final GlobeModel worldmapModel = GlobeModel();
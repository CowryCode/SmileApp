import 'package:medico/config/app_config.dart';
import 'package:medico/pages/custompages/statemanagement/models/sgmessage.dart';

class MyAppState{
  SGMessage sg_message = SGMessage(content: "", updated: false);
  MyAppState({this.sg_message});
}
import 'package:medico/config/app_config.dart';
import 'package:medico/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:medico/pages/custompages/statemanagement/models/timerdatamodel.dart';

class MyAppState{
  SGMessage sg_message = SGMessage(content: "", updated: false);
  LuckPotTimerstatemodel luckPotTimerstatemodel = LuckPotTimerstatemodel(activate: false);
  MyAppState({this.sg_message, this.luckPotTimerstatemodel});
}
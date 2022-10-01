import 'package:SmileApp/config/app_config.dart';
import 'package:SmileApp/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/statemanagement/models/timerdatamodel.dart';

class MyAppState{
  SGMessage sg_message = SGMessage(content: "", updated: false);
  LuckPotTimerstatemodel luckPotTimerstatemodel = LuckPotTimerstatemodel(activate: false);
  MyAppState({required this.sg_message, required this.luckPotTimerstatemodel});
}
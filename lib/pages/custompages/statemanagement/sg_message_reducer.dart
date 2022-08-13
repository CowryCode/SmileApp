
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';

MyAppState updateSGmessageReducer(MyAppState state, dynamic action){
  if(action is UpdateSGmessageAction){
    return MyAppState(
      sg_message: action.updateSGmessage.updated == true
          ? action.updateSGmessage
          : state.sg_message,
      luckPotTimerstatemodel: state.luckPotTimerstatemodel
    );
  }else if(action is LuckPotTimerAction){
    return MyAppState(
      sg_message: state.sg_message,
      luckPotTimerstatemodel: action.luckPotTimerstatemodel.activate != state.luckPotTimerstatemodel.activate
        ? action.luckPotTimerstatemodel : state.luckPotTimerstatemodel
    );
  }
  return state;
}
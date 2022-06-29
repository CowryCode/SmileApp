
import 'package:medico/pages/custompages/statemanagement/actions.dart';
import 'package:medico/pages/custompages/statemanagement/my_app_state.dart';

MyAppState updateSGmessageReducer(MyAppState state, dynamic action){
  if(action is UpdateSGmessageAction){
    return MyAppState(
      sg_message: action.updateSGmessage.updated == true
          ? action.updateSGmessage
          : state.sg_message
    );
  }
  return state;
}
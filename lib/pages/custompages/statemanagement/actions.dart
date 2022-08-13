

import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/timerdatamodel.dart';

class UpdateSGmessageAction{
  final SGMessage updateSGmessage;
  UpdateSGmessageAction(this.updateSGmessage);
}

class LuckPotTimerAction{
  final  LuckPotTimerstatemodel luckPotTimerstatemodel;
  LuckPotTimerAction(this.luckPotTimerstatemodel);
}

// StoreProvider.of<AppState>(context).dispatch(UpdatePatientProfileAction(patientprofile));

// child: StoreConnector<AppState, PatientProfilePodo>(
// converter: (store) => store.state.patientProfilePodo,
// builder: (context, PatientProfilePodo patientprofile) => Row(
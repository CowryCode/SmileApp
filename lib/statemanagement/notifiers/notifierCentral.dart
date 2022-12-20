import 'package:SmileApp/apis/models/globalprogressmodel.dart';
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/models/personalprogressmodel.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/pages/custompages/chat/model/buddychat.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/LeaderBoardNotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/ProgressTableNotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/SGmessageModel.dart';
import 'package:SmileApp/statemanagement/notifiers/SmileAppNotifiers.dart';
import 'package:SmileApp/statemanagement/notifiers/SGmessageNotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/SmileGameNotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/chatnotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/readtribemessagenotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/tribeempathyrequestnotifier.dart';
import 'package:SmileApp/statemanagement/notifiers/tribemessagenotifier.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

//final SmileAppValueNotifier counterNotifier = SmileAppValueNotifier(value: Smile_Count_Initial);
final SmileAppValueNotifier smileAppValueNotifier = SmileAppValueNotifier(
  value: NotifiersSection(
      smileDurationCount: ValueNotifier<int>(Smile_Count_Initial),
      smileDurationCompleted: ValueNotifier<bool>(false),
      showCountDown: ValueNotifier<bool>(false),
      countriesIndexString: ValueNotifier<String>("0"),
      showShowMoodRating: ValueNotifier<bool>(false),
      mapdatasource: ValueNotifier<MapShapeSource>(MapShapeSource.asset(
        "assets/world_map.json",
        shapeDataField: "admin",
       // dataCount: 1,
        dataCount: worldmapModel.getProcessedcountries(userCountriesIndexString: "0").length,
        primaryValueMapper: (int index) {
         // return "Afghanistan";
          return  worldmapModel.getProcessedcountries(userCountriesIndexString: "0").elementAt(index).state;
        },
        shapeColorValueMapper: (int index) {
         // return "Low";
          return worldmapModel.getProcessedcountries(userCountriesIndexString: "0").elementAt(index).storage;
        },
        shapeColorMappers: [
          MapColorMapper(value: "Low", color: Colors.red),
          MapColorMapper(value: "Medium", color: Colors.orange),
          MapColorMapper(value: "High", color: Colors.green)
        ],
      )),
    //nextCountry: ValueNotifier<String>("Afghanistan"),
    nextCountry: ValueNotifier<String>(worldmapModel.modelsDictionary().first.state),
    moodmodel:  ValueNotifier<MoodModel>(MoodModel()),
  ),
);

final SGmessageNotifier messageNotifier = SGmessageNotifier(value: SGmessageModel(msg: "", index: 0));

final ProgressTableNotifier progressTable = ProgressTableNotifier(value: [
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
  PersonalProgresses(targetValue: 170, scoredValue: 0),
]);

final LeaderBoardNotifier globalscoresTable = LeaderBoardNotifier(value: [
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
  GlobalProgresses(username: "Pikin", acumulatedValue: 120),
]);

final TribeMessagesNotifier tribeMessagesNotifier = TribeMessagesNotifier(value: []);
final ReadTribeMessagesNotifier readtribeMessageNotifier = ReadTribeMessagesNotifier(value: []);
final TribeEmpathyRequestNotifier tribeEmpathyRequestNotifier = TribeEmpathyRequestNotifier(value: []);
final ChatHistoryValueNotifier chatcentralnotifier = ChatHistoryValueNotifier();
final SmileGameNofitier smileGameNofitier = SmileGameNofitier(value: SmileGameVariables(
    targetHorrizontalposition: TargetObjectHorrizontalInitializer,
    movingObjectHorrizontalposition: TargetObjectHorrizontalInitializer - TargetObjectDistance));




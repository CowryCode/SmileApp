import 'package:SmileApp/apis/models/countrymodel.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/statemanagement/notifiers/SGmessageModel.dart';
import 'package:SmileApp/statemanagement/notifiers/SmileAppNotifiers.dart';
import 'package:SmileApp/statemanagement/notifiers/SGmessageNotifier.dart';
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
        dataCount: 1,
        primaryValueMapper: (int index) {
          return "Afghanistan";
        },
        shapeColorValueMapper: (int index) {
          return "Low";
        },
        shapeColorMappers: [
          MapColorMapper(value: "Low", color: Colors.red),
          MapColorMapper(value: "High", color: Colors.green)
        ],
      ))),
);

final SGmessageNotifier messageNotifier = SGmessageNotifier(value: SGmessageModel(msg: "", index: 0));
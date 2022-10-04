import 'package:SmileApp/models/countrymodel.dart';
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
  ),
);

final SGmessageNotifier messageNotifier = SGmessageNotifier(value: SGmessageModel(msg: "", index: 0));
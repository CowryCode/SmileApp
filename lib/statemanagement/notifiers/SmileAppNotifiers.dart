import 'package:SmileApp/apis/models/countrymodel.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class NotifiersSection{
  ValueNotifier<int> smileDurationCount = ValueNotifier<int>(Smile_Count_Initial);
  ValueNotifier<bool> smileDurationCompleted = ValueNotifier<bool>(false);
  ValueNotifier<bool> showCountDown = ValueNotifier<bool>(false);
  ValueNotifier<String> countriesIndexString = ValueNotifier<String>("0");
  ValueNotifier<bool> showShowMoodRating = ValueNotifier<bool>(false);
  ValueNotifier<MapShapeSource>? mapdatasource;

  NotifiersSection({
    required this.smileDurationCount,
    required this.smileDurationCompleted,
    required this.showCountDown,
    required this.countriesIndexString,
    required this.showShowMoodRating,
    this.mapdatasource,
  });

}
class SmileAppValueNotifier extends ValueNotifier<NotifiersSection> {
  SmileAppValueNotifier({required NotifiersSection value}) : super(value);

  void updateSmileDurationCount(){
    value.smileDurationCount.value--;
    notifyListeners();
  }
  void refreshSmileDurationCount(){
    value.smileDurationCount.value = Smile_Count_Initial;
    notifyListeners();
  }

  void updateSmileDurationCompleted({required bool completed}){
    value.smileDurationCompleted.value = completed;
    notifyListeners();
  }

  void updateShowCountDown({required bool showCoundown}){
    value.showCountDown.value = !value.showCountDown.value;
    notifyListeners();
  }

  void updateShowMoodRating({required bool showMoodrate}){
    value.showShowMoodRating.value = showMoodrate;
  }

  void updateCountriesIndexString({required String countriesIndex}){
    value.countriesIndexString.value = countriesIndex;
    updateMapData(countriesIDstring: countriesIndex);
    notifyListeners();
  }

  void updateMapData({required String countriesIDstring}){
    try {
      List<Model>? data = worldmapModel.getProcessedcountries(userCountriesIndexString: countriesIDstring);
      if (data == null) {
        data = <Model>[Model(state: "Country Name", storage: "Low")];
      }
      MapShapeSource sublayerDataSource = MapShapeSource.asset(
        "assets/world_map.json",
        shapeDataField: "admin",
        dataCount: data.length,
        primaryValueMapper: (int index) {
          return data![index].state;
        },
        shapeColorValueMapper: (int index) {
          return data![index].storage;
        },
        shapeColorMappers: [
          MapColorMapper(value: "Low", color: Colors.red),
          MapColorMapper(value: "High", color: Colors.green)
        ],
      );
      if(value.mapdatasource == null){
        value.mapdatasource = ValueNotifier<MapShapeSource>(sublayerDataSource);
      }else{
        value.mapdatasource!.value = sublayerDataSource;
      }
    }catch(e){
      // Do Nothing
    }
  }
}

// class SmileAppValueNotifier extends ValueNotifier<int> {
//     SmileAppValueNotifier({int? value}) : super(value ?? 0);
//   void increment() {
//     value++;
//     notifyListeners();
//   }
//
//   void decrement() {
//     value--;
//     notifyListeners();
//   }
//
//   void reStartvalue({required int newValue}){
//     value = newValue;
//     notifyListeners();
//   }
//
//   int getCurrentValue(){
//     return value;
//   }
// }
import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/models/countrymodel.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class NotifiersSection {
  ValueNotifier<int> smileDurationCount =
      ValueNotifier<int>(Smile_Count_Initial);
  ValueNotifier<bool> smileDurationCompleted = ValueNotifier<bool>(false);
  ValueNotifier<bool> showCountDown = ValueNotifier<bool>(false);
  ValueNotifier<String> countriesIndexString = ValueNotifier<String>("0");
  ValueNotifier<bool> showShowMoodRating = ValueNotifier<bool>(false);
  ValueNotifier<MapShapeSource> mapdatasource =
      ValueNotifier<MapShapeSource>(MapShapeSource.asset(
    "assets/world_map.json",
    shapeDataField: "admin",
   // dataCount: 1,
    dataCount: worldmapModel.getProcessedcountries(userCountriesIndexString: "0").length,
    primaryValueMapper: (int index) {
     // return "Afghanistan";
      return worldmapModel.getProcessedcountries(userCountriesIndexString: "0").elementAt(index).state;
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
  ));


  // ValueNotifier<String> nextCountry = ValueNotifier<String>("Afghanistan");
  ValueNotifier<String> nextCountry = ValueNotifier<String>(worldmapModel.modelsDictionary().first.state);
  ValueNotifier<int> speechActivationCount = ValueNotifier<int>(0);
  ValueNotifier<bool> activatespeech = ValueNotifier<bool>(false);
  ValueNotifier<bool> deactivetSound = ValueNotifier<bool>(false);
  ValueNotifier<MoodModel> moodmodel = ValueNotifier<MoodModel>(MoodModel());
 // ValueNotifier<int> smileCompletedCountryCounter = ValueNotifier<int>(0);
  NotifiersSection({
    required this.smileDurationCount,
    required this.smileDurationCompleted,
    required this.showCountDown,
    required this.countriesIndexString,
    required this.showShowMoodRating,
    required this.mapdatasource,
    required this.nextCountry,
    required this.moodmodel,
  });
}

class SmileAppValueNotifier extends ValueNotifier<NotifiersSection> {
  SmileAppValueNotifier({required NotifiersSection value}) : super(value);

  void updateSmileDurationCount() {
    value.smileDurationCount.value--;
    notifyListeners();
  }

  void refreshSmileDurationCount() {
    value.smileDurationCount.value = Smile_Count_Initial;
    notifyListeners();
  }

  void updateSmileDurationCompleted({required bool completed}) {
    value.smileDurationCompleted.value = completed;
    notifyListeners();
  }

  void updateShowCountDown({required bool showCoundown}) {
    value.showCountDown.value = showCoundown;
   // value.showCountDown.value = !value.showCountDown.value;
    notifyListeners();
  }

  void updateShowMoodRating({required bool showMoodrate}) {
    value.showShowMoodRating.value = showMoodrate;
  }

  void updateCountriesIndexString({required String countriesIndex, required int nextID}) {
    value.countriesIndexString.value = countriesIndex;
    updateMapData(countriesIDstring: countriesIndex, nextCountryID: nextID);
    notifyListeners();
  }

  void updateMapData({required String countriesIDstring, required int nextCountryID}) {
    try {
      List<Model>? data = worldmapModel.getProcessedcountries(
          userCountriesIndexString: countriesIDstring);
      if (data == null) {
        data = <Model>[Model(state: "Afghanistan", storage: "Low")];
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
          MapColorMapper(value: "Medium", color: Colors.orange),
          MapColorMapper(value: "High", color: Colors.green)
        ],
      );
      value.mapdatasource.value = sublayerDataSource;

      value.nextCountry.value = data.last.state; //last as at 05/12/2022
      notifyListeners();
    } catch (e) {
      // Do Nothing
    }
  }
  void activateSpeech({required bool activateSpeech}) {
    value.activatespeech.value = activateSpeech;
  }
  void updateSpeechActivationCount() {
    value.speechActivationCount.value++;
    if(value.speechActivationCount.value >= Speech_Activation_Count){
      value.activatespeech.value = true;
    }
    notifyListeners();
  }
  void speechActivationCountInitialized() {
    value.speechActivationCount.value = 0;
    value.activatespeech.value = false;
    notifyListeners();
  }
  void muteSpeech(){
    value.activatespeech.value = false;
    notifyListeners();
  }
  void updateSoundDeactivation({required bool deactivateSound}) {
    value.deactivetSound.value = deactivateSound;
    notifyListeners();
  }

  void initializeMoodNotifier({required MoodModel mood}){
    value.moodmodel.value = mood;
    notifyListeners();
  }

  void resetMoodObject({required MoodModel savedmood}){
    value.moodmodel.value.resetMood(savedMood: savedmood);
    notifyListeners();
  }

  void showMoodRating({required bool show_pop_up}){
    value.showShowMoodRating.value = show_pop_up;
    notifyListeners();
  }

  // void resetMoodObject(){
  //   value.moodmodel.value.resetMood();
  //   notifyListeners();
  // }

  //JUST ADDED
  // void updateSmileDurationCounter(){
  //   value.smileCompletedCountryCounter.value++;
  //   notifyListeners();
  // }

  // int getSmileCompletedCountriesCount(){
  //   return  value.smileCompletedCountryCounter.value;
  // }
}


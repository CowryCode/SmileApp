import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:flutter/material.dart';

class NotifiersSection{
  ValueNotifier<int> smileDurationCount = ValueNotifier<int>(Smile_Count_Initial);
  ValueNotifier<bool> smileDurationCompleted = ValueNotifier<bool>(false);
  ValueNotifier<bool> showCountDown = ValueNotifier<bool>(false);
  ValueNotifier<String> countriesIndexString = ValueNotifier<String>("0");

  NotifiersSection({
    required this.smileDurationCount,
    required this.smileDurationCompleted,
    required this.showCountDown,
    required this.countriesIndexString
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

  void updateCountriesIndexString({required String countriesIndex}){
    value.countriesIndexString.value = countriesIndex;
    notifyListeners();
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
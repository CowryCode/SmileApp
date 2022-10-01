import 'package:flutter/material.dart';

class CountDownValueNotifier extends ValueNotifier<int> {
  CountDownValueNotifier({int? value}) : super(value ?? 0);
  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  void reStartvalue({required int newValue}){
    value = newValue;
    notifyListeners();
  }

  int getCurrentValue(){
    return value;
  }
}
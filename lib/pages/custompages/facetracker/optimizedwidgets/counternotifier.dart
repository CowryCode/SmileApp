import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier({int? value}) : super(value ?? 0);
  void increment() {
    value++;
  }

  void decrement({required int indexCount}) {
    value = indexCount - 1;
  }
}
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/statemanagement/notifiers/SmileAppNotifiers.dart';
import 'package:flutter/material.dart';

//final SmileAppValueNotifier counterNotifier = SmileAppValueNotifier(value: Smile_Count_Initial);
final SmileAppValueNotifier smileAppValueNotifier = SmileAppValueNotifier(
  value: NotifiersSection(
    smileDurationCount: ValueNotifier<int>(Smile_Count_Initial),
    smileDurationCompleted: ValueNotifier<bool>(false),
    showCountDown: ValueNotifier<bool>(false),
    countriesIndexString: ValueNotifier<String>("0"),
    showShowMoodRating: ValueNotifier<bool>(false),
  ),
);

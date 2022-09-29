import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmileDurationCounter extends StatefulWidget {
  const SmileDurationCounter({Key? key}) : super(key: key);

  @override
  _SmileDurationCounterState createState() => _SmileDurationCounterState();
}

class _SmileDurationCounterState extends State<SmileDurationCounter> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ScaleAnimatedText('110',
          scalingFactor: 0.2,
          textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.green,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

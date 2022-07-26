import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LuckPot extends StatefulWidget {
  const LuckPot({Key key}) : super(key: key);

  @override
  _LuckPotState createState() => _LuckPotState();
}

class _LuckPotState extends State<LuckPot> {
  int _value = 0;
  bool _activated = false;
  final Duration timerTastoPremuto = Duration(days: 0,hours: 0, minutes: 10);


  @override
  void initState() {
    randomize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LuchMatrics());
  }

  Widget LuchMatrics() {
    return Wrap(
      children: List<Widget>.generate(
        20,
        (int index) {
          return _value == index && _activated == true
              ? IconButton(
                  key: Key("$index"),
                  icon: const Icon(Icons.call),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {},
                )
              : ChoiceChip(
                  key: Key('$index'),
                  elevation: 6.0,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  //  label: Text('Item $index'),
                  label: Text('Item'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                     // _activated = index == 10 ? true : false;
                      print("Selected Value if $_value");
                    });
                  },
                );
        },
      ).toList(),
    );
  }

  void randomize(){
    int _start = timerTastoPremuto.inMilliseconds;
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    const oneDecimal = const Duration(milliseconds: 1000);
    Timer _timer = new Timer.periodic(
        oneDecimal,
            (Timer timer) =>
            setState(() {
              _value = random.nextInt(23);
              print('Timer is : $_start  Index Value is $_value');
              if (_start == 500000) {
                _activated = true;
                timer.cancel();
              } else {
                _start = _start - 400;
              }
              // if (_start < 100) {
              //   timer.cancel();
              // } else {
              //   _start = _start - 400;
              // }
            }));
  }
}

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LuckPot extends StatefulWidget {
  const LuckPot({Key key}) : super(key: key);

  @override
  _LuckPotState createState() => _LuckPotState();
}

class _LuckPotState extends State<LuckPot>{
  int _value = 0;
  bool _activated = false;
  int _activation_index = -1;
  final Duration timerTastoPremuto = Duration(days: 0,hours: 0, minutes: 10);

  double _tweenMax = 24;

  @override
  void initState() {
    randomize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LuckMatrics());
       // child: giftAlert());
  }

  Widget LuckMatrics() {
    return Wrap(
      children: List<Widget>.generate(
        20,
        (int index) {
          return _activation_index == index && _activated == true
               ?
              // IconButton(
              //     key: Key("$index"),
              //     icon: const Icon(Icons.call),
              //     color: Theme.of(context).colorScheme.secondary,
              //     onPressed: () {},
              //   )
                ChoiceChip(
                  key: Key('$index'),
                  selectedColor: Theme.of(context).primaryColor,
                  avatar: Image.asset("images/custom/giftopen1.png"),
                  elevation: 6.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  label: Text('open', style: TextStyle(color: Colors.red),),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : _value;
                      print("Selected Value is $_value");
                      //TODO: REPLACE THE TITLE WITH ACTUAL DATA
                      showAlertDialog(context: context,title: "Total points: 67", message: "Message", amount: index);
                    });
                  },
                )
              : ChoiceChip(
                  key: Key('$index'),
                  avatar: Image.asset("images/custom/gift.png"),
                  elevation: 6.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  label: Text('  ?', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                    //  _value = selected ? index : null;
                      _value = selected ? index : _value;
                     // _activated = index == 10 ? true : false;
                      print("Selected Value if $_value");
                     // showAlertDialog(context: context,title: "Total points: 67", message: "Message", repeat: true, amount: index);
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
    const oneDecimal = const Duration(milliseconds: 1000);
    Timer _timer = new Timer.periodic(
        oneDecimal,
            (Timer timer) =>
            setState(() {
              _value = random.nextInt(23);
              print('Timer is : $_start  Index Value is $_value');
              if (_start < 600000) {
                _activated = true;
                _activation_index = _value;
                timer.cancel();
              } else {
                _start = _start - 1000;
              }
              // if (_start < 100) {
              //   timer.cancel();
              // } else {
              //   _start = _start - 400;
              // }
            }));
  }



  Widget giftAlert({@required int amountWon}){
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:DecorationImage(
              image:AssetImage('images/custom/giftopen1.png'),
              fit: BoxFit.cover,)),
      child: Stack(
        children: <Widget>[
          Center(
            //  child: Text(' Congratulations! your won $_value points', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'SF',
                color: Colors.red
              ),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ScaleAnimatedText('$amountWon points won!',scalingFactor: 0.2),
                    ScaleAnimatedText('Congratulations !',scalingFactor: 0.2),
                    ScaleAnimatedText('10 points won!',scalingFactor: 0.2),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _scale(){
    return SizedBox(
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 50.0,
          fontFamily: 'SF',
        ),
        child: Center(
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ScaleAnimatedText('Eat',scalingFactor: 0.2),
              ScaleAnimatedText('Code',scalingFactor: 0.2),
              ScaleAnimatedText('Sleep',scalingFactor: 0.2),
              ScaleAnimatedText('Repeat',scalingFactor: 0.2),

            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog({@required BuildContext context, @required String title, @required String message, @required int amount}) {


    // set up the button
    Widget okButton = TextButton(
      child: Text("Try Again"),
      onPressed: () {
          // KICK START SMILING
        setState(() {
          _activation_index = -1;
        });
          Navigator.of(context).pop();
          randomize();
      },
    );

    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        setState(() {
          _activation_index = -1;
        });
        Navigator.of(context).popAndPushNamed("/");
        // randomize();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),
      title: Text(title),
      // content: Text(message),
      content:  giftAlert(amountWon: amount),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



}



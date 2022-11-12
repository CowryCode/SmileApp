import 'package:SmileApp/pages/instructions/getStarted.dart';
import 'package:SmileApp/pages/instructions/on_boarding_widget.dart';
import'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GetStarted(),
          OnBoardingWidget(),
        ],
      ),
    );
  }
}
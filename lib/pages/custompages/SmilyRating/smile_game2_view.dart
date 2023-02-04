import 'dart:math';

import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmileGame2 extends StatefulWidget {
  const SmileGame2({Key? key}) : super(key: key);

  @override
  _SmileGame2State createState() => _SmileGame2State();
}

class _SmileGame2State extends State<SmileGame2> {
  var _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child) {
               return Visibility(
                 visible: true,
                 child: AnimatedPositioned(
                    // top: 17.0,
                    // left: 300.0,
                   top: gamevariables.targetVerticalposition,
                   left: gamevariables.targetHorrizontalposition,
                    child: Icon(
                      FontAwesomeIcons.house,
                      size: 60,
                      color: Colors.orange,
                    ),
                    duration: Duration(milliseconds: 300),
                  ),
               );
              }
          ),
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child){
                return Visibility(
                  // visible: !gamevariables.targetCaught,
                  visible: true,
                  child: AnimatedPositioned(
                    top: gamevariables.targetVerticalposition + 7,
                    left: gamevariables.targetHorrizontalposition + 6,
                    child: Icon(
                      FontAwesomeIcons.house,
                      size: 50,
                     // color: Theme.of(context).primaryColor,
                      color: Colors.white,
                    ) ,
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
          ),
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child){
                return Visibility(
                  visible: true,
                  child: AnimatedPositioned(
                    top: gamevariables.targetVerticalposition + 7,
                    left: gamevariables.targetHorrizontalposition + 80,
                    child: Icon(
                      FontAwesomeIcons.house,
                      size: 50,
                      color: Colors.orange,
                    ) ,
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

}

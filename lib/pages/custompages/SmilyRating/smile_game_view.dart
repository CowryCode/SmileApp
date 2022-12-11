import 'dart:math';

import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmileGame extends StatefulWidget {
  const SmileGame({Key? key}) : super(key: key);

  @override
  _SmileGameState createState() => _SmileGameState();
}

class _SmileGameState extends State<SmileGame> {
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
            builder: (context, SmileGameVariables gamevariables, child){
             return Visibility(
               visible: !gamevariables.targetCaught,
               child: AnimatedPositioned(
                          //    top: 27.0,
                          //    left: 310.0,
                          top: gamevariables.movingObjectVerticalposition,
                          left: gamevariables.movingObjectHorrizontalposition,
                          child: Icon(
                            Icons.star,
                            size: 32,
                            color: Colors.orange,
                          ) ,
                          duration: Duration(milliseconds: 300),
                        ),
             );
            }
          ),
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child) {
               return Visibility(
                 visible: !gamevariables.targetCaught,
                 child: AnimatedPositioned(
                    // top: 17.0,
                    // left: 300.0,
                   top: gamevariables.targetVerticalposition,
                   left: gamevariables.targetHorrizontalposition,
                    child: Icon(
                     Icons.star_border,
                      size: 52,
                      color: Colors.orange,
                    ),
                    duration: Duration(milliseconds: 300),
                  ),
               );
              }
          ),
          //TODO: DO NOT REMOVE YET
          // Positioned(
          //   bottom: 0,
          //   child: Row(
          //                 children: [
          //                   MaterialButton(
          //                     onPressed: (){
          //                       smileGameNofitier.moveObject(smilesize: 0.9);
          //                     },
          //                     child: Text(
          //                       'MOVE OBJECT', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
          //                     ),
          //                   ),
          //                   MaterialButton(
          //                     onPressed: (){
          //                       smileGameNofitier.changeTargetObjectPosition();
          //                     },
          //                     child: Text(
          //                       'REFRESH TARGET', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          // ),
        ],
      ),
    );
  }

}

import 'dart:ffi';

import 'package:SmileApp/apis/Utilities.dart';
import 'package:SmileApp/config/custom_design.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerformanceTable extends StatefulWidget {
  const PerformanceTable({Key? key}) : super(key: key);

  @override
  _PerformanceTableState createState() => _PerformanceTableState();
}

class _PerformanceTableState extends State<PerformanceTable> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 50,
              padding: const EdgeInsets.only(top:5,left:12.0,right: 12.0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    'Day ',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    'Target \n Value',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    'Achieved \n Value',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    'Rating',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
        Flexible(
          child: ListView.builder(
             // itemCount: 20,
              itemCount: progressTable.value.length,
              itemBuilder: (BuildContext context, int index) {
               // return tableRow(day: index + 1, targetValue: 10, scoredValue: 5);
                return tableRow(day: index + 1, targetValue: progressTable.value[index].targetValue!, scoredValue: progressTable.value[index].scoredValue!);
              }),
        ),
      ],
    );
    // return Center(
    //       child: Container(
    //         color: Colors.white,
    //         height: MediaQuery.of(context).size.height * 0.8,
    //         child:
    //         SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             children: <Widget>[
    //               SizedBox(height: 20,),
    //             Card(
    //               elevation:0.2,
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(16.0),
    //               ),
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
    //                   ],
    //                 ),
    //                 padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
    //                 child:Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
    //                     Text(
    //                       'Day ',
    //                       textAlign: TextAlign.left,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black45,
    //                         fontFamily: 'Poppins',
    //                         fontSize: 12.0,
    //                       ),
    //                     ),
    //                     SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
    //                     Text(
    //                       'Target \n Value',
    //                       textAlign: TextAlign.left,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black45,
    //                         fontFamily: 'Poppins',
    //                         fontSize: 12.0,
    //                       ),
    //                     ),
    //                     SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
    //                     Text(
    //                       'Achieved \n Value',
    //                       textAlign: TextAlign.left,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black45,
    //                         fontFamily: 'Poppins',
    //                         fontSize: 12.0,
    //                       ),
    //                     ),
    //                     SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
    //                     Text(
    //                       'Rating',
    //                       textAlign: TextAlign.left,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black45,
    //                         fontFamily: 'Poppins',
    //                         fontSize: 12.0,
    //                       ),
    //                     ),
    //
    //                   ],
    //                 ),
    //                 //   ],
    //                 // ),
    //               ),
    //             ),
    //               tableRow(day: 1, targetValue: 12, scoredValue: 10),
    //               tableRow(day: 2, targetValue: 12, scoredValue: 7),
    //               tableRow(day: 3, targetValue: 12, scoredValue: 4),
    //               tableRow(day: 4, targetValue: 12, scoredValue: 10),
    //               tableRow(day: 5, targetValue: 12, scoredValue: 6),
    //               tableRow(day: 6, targetValue: 12, scoredValue: 10),
    //               tableRow(day: 7, targetValue: 12, scoredValue: 8),
    //               tableRow(day: 8, targetValue: 12, scoredValue: 3),
    //               tableRow(day: 9, targetValue: 12, scoredValue: 12),
    //               tableRow(day: 10, targetValue: 12, scoredValue: 12),
    //               tableRow(day: 11, targetValue: 12, scoredValue: 24),
    //               tableRow(day: 12, targetValue: 12, scoredValue: 12),
    //               tableRow(day: 13, targetValue: 12, scoredValue: 68),
    //               tableRow(day: 14, targetValue: 12, scoredValue: 12),
    //             ],
    //           )
    //         ),
    //       ),
    //     );
  }

  Widget tableRow({
    required int day,
    required int targetValue,
    required int scoredValue,
  }) {

    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(0, 4),
                blurRadius: 10)
          ],
        ),
        padding: const EdgeInsets.only(
            top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'Day $day',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontFamily: 'Poppins',
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              '$targetValue',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontFamily: 'Poppins',
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Text(
              '$scoredValue',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontFamily: 'Poppins',
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  _getStars(score: scoredValue, target: targetValue),
            ),

          ],
        ),
        //   ],
        // ),
      ),
    );
  }

  List<Widget> _getStars({required int score, required int target}){
    int starcount = Utilities().getPercentage(value: score, total: target);
    if(starcount < 1){
      return [Icon(FontAwesomeIcons.solidStar, color: Colors.red, size: 12,),];
    } else{
      if(starcount <= 20){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
        ];
      }else if(starcount > 20 && starcount <= 40 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
        ];
      }else if(starcount > 40 && starcount <= 60 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      }else if(starcount > 60 && starcount <= 80 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      }else if(starcount > 80){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      }else{
        return [Icon(FontAwesomeIcons.solidStar, color: Colors.red, size: 12,),];
      }
    }
  }
}

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
    //int starcount = Utilities().getPercentage(value: score, total: target);
    if(score < 1){
      return [Icon(FontAwesomeIcons.solidStar, color: Colors.red, size: 12,),];
    } else{
      if(score > 0 && score <= 3){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
        ];
      }else if(score > 3 && score <= 6 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
        ];
      }else if(score > 6 && score <= 8 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      }else if(score > 8 && score <= 10 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      }else if(score > 10 && score <= 13 ){
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
        ];
      } else if(score > 13){
        print('START COUNT VALUE IS : $score');
        return[
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.solidStar, color: Colors.green, size: 12,),
          Icon(FontAwesomeIcons.trophy, color: Colors.blueGrey, size: 12,),
        ];
      }else{
        return [Icon(FontAwesomeIcons.solidStar, color: Colors.red, size: 12,),];
      }
    }
  }

}

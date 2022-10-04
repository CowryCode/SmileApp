import 'package:SmileApp/config/custom_design.dart';
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
  Widget build(BuildContext context) {
    return Center(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                Card(
                  elevation:0.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
                      ],
                    ),
                    padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                        Text(
                          'Day ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                        Text(
                          'Target Value',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                        Text(
                          'Achieved Value',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1,),


                      ],
                    ),
                    //   ],
                    // ),
                  ),
                ),
                  tableRow(day: 1, targetValue: 12, scoredValue: 10),
                  tableRow(day: 2, targetValue: 12, scoredValue: 7),
                  tableRow(day: 3, targetValue: 12, scoredValue: 4),
                  tableRow(day: 4, targetValue: 12, scoredValue: 10),
                  tableRow(day: 5, targetValue: 12, scoredValue: 6),
                  tableRow(day: 6, targetValue: 12, scoredValue: 10),
                  tableRow(day: 7, targetValue: 12, scoredValue: 8),
                  tableRow(day: 8, targetValue: 12, scoredValue: 3),
                  tableRow(day: 9, targetValue: 12, scoredValue: 12),
                  tableRow(day: 10, targetValue: 12, scoredValue: 12),
                  tableRow(day: 11, targetValue: 12, scoredValue: 24),
                  tableRow(day: 12, targetValue: 12, scoredValue: 12),
                  tableRow(day: 13, targetValue: 12, scoredValue: 68),
                  tableRow(day: 14, targetValue: 12, scoredValue: 12),
                ],
              )
            ),
          ),
        );
  }

  Widget tableRow({required int day, required int targetValue, required int scoredValue, }){
    return Card(
      elevation:0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
          ],
        ),
        padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
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
            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
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
            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
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
            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
            if(scoredValue >= 9 ) Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.solidStar,color: Colors.green, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.green, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.green, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.green, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.green, size: 12 ,),
              ],
            ),
            if(scoredValue > 5 && scoredValue < 9 )Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.solidStar,color: Colors.orange, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.orange, size: 12 ,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.orange, size: 12 ,),
              ],
            ),
            if(scoredValue <= 5)Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.solidStar,color: Colors.red, size: 12 ,),
              ],
            ),

          ],
        ),
        //   ],
        // ),
      ),
    );
  }
}



import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalPerformanceTable extends StatefulWidget {
  const GlobalPerformanceTable({Key? key}) : super(key: key);

  @override
  _GlobalPerformanceTableState createState() => _GlobalPerformanceTableState();
}

class _GlobalPerformanceTableState extends State<GlobalPerformanceTable> {

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Top Smilers',
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Flexible(
          child: ListView.builder(
            // itemCount: 20,
              itemCount: globalscoresTable.value.length,
              itemBuilder: (BuildContext context, int index) {
                return progress(index: index, rank: globalscoresTable.value[index].globalpercent!);
              }),
        ),
      ],
    );
  }


  Widget progress({required int index, required double rank}){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (1 - (index + 1)/(index + 3)),
          padding: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(""),
        ),
        Positioned(
          left: 10.0,
          top: 7.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              SizedBox(width: 5,),
              Text("${globalscoresTable.value[index].username}"),
              SizedBox(width: 10,),
             // Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  _getStars(globalRank: rank),
              ),
              SizedBox(width: 20,),
              Text("${globalscoresTable.value[index].globalpercent}%"),
            ],
          ),
        )
      ],
    );

  }

  List<Widget> _getStars({required double globalRank}){
    int starcount = globalRank.round();
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

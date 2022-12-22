import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
import 'package:SmileApp/pages/custompages/leaderboard/globalperformancetable.dart';
import 'package:SmileApp/pages/custompages/leaderboard/performancetable.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/leaderboardmodel.dart';

class LeadderBoard extends StatefulWidget {
  // final User currentUser=User.init().getCurrentUser();
 // final LeaderBoardModel leaderBoardModel = LeaderBoardModel.init().getCurrentLeaderBoardModel();
  @override
  _LeadderBoardState createState() => _LeadderBoardState();
}

class _LeadderBoardState extends State<LeadderBoard> {
 // List<LeaderBoardModel>? leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
            ,
            onPressed: (){
             Navigator.of(context).pop();
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            'Achievements',
            style: TextStyle(
              fontSize:22.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.globe,color: Colors.white,semanticLabel: "Smile Gram",)),
              Tab(icon: Icon(FontAwesomeIcons.thumbsUp,color: Colors.white,semanticLabel: "Progress",)),
             // Tab(icon: Icon(FontAwesomeIcons.barsProgress,color: Colors.white,semanticLabel: "Progress",)),
              Tab(icon: Icon(FontAwesomeIcons.trophy,color: Colors.white,semanticLabel: "LeaderBoard",)),
            ],
          ),
        ),

        body:TabBarView(
          children: [
            _map1(),
            PerformanceTable(),
            GlobalPerformanceTable(),
          ],
        ),
      ),
    );
  }

  Widget _map(){
    return Column(
      children: <Widget>[

        HappinessMap(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ValueListenableBuilder(
                // valueListenable: counterNotifier,
                valueListenable: smileAppValueNotifier.value.nextCountry,
                builder: (context, String value, child) {
                  return Text(
                    '   $value',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  );
                },
              ),
              Text(
                'Needs your smile to be GREEN ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              IconButton(
                  onPressed: (){
                    smileAppValueNotifier.updateShowCountDown(showCoundown: true);
                    Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
                  },
                  icon: Icon(FontAwesomeIcons.play,color: Colors.green,)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _map1(){
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your Smile Map',
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
                ],
              ),
            ),
          ],
        ),
        //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
        HappinessMap(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ValueListenableBuilder(
                // valueListenable: counterNotifier,
                valueListenable: smileAppValueNotifier.value.nextCountry,
                builder: (context, String value, child) {
                  return Text(
                    '   $value',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  );
                },
              ),
              Text(
                'Needs your smile to be GREEN ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              IconButton(
                  onPressed: (){
                    smileAppValueNotifier.updateShowCountDown(showCoundown: true);
                    Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
                  },
                  icon: Icon(FontAwesomeIcons.play,color: Colors.green,)),
            ],
          ),
        ),
      ],
    );
  }


}

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
              Tab(icon: Icon(FontAwesomeIcons.barsProgress,color: Colors.white,semanticLabel: "Progress",)),
              Tab(icon: Icon(FontAwesomeIcons.faceSmileBeam,color: Colors.white,semanticLabel: "LeaderBoard",)),
            ],
          ),
        ),

        body:TabBarView(
          children: [
            _map(),
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


}

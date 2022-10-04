import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
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
 // model.DoctorsList doctorsList;
  List<LeaderBoardModel>? leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
  @override
  void initState() {
  //  this.doctorsList = new model.DoctorsList();
  //  _leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
    print("THE SIZE IS ${leaderBoardModelLIST!.length}");
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
            _smileGramLeaderboar(),
            // Column(
            //   children: <Widget>[
            //     HappinessMap(),
            //     Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: <Widget>[
            //           ValueListenableBuilder(
            //             // valueListenable: counterNotifier,
            //             valueListenable: smileAppValueNotifier.value.nextCountry,
            //             builder: (context, String value, child) {
            //               return Text(
            //                 '   $value',
            //                 textAlign: TextAlign.center,
            //                 overflow: TextOverflow.ellipsis,
            //                 style: const TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.red,
            //                   fontFamily: 'Poppins',
            //                   fontSize: 16.0,
            //                 ),
            //               );
            //             },
            //           ),
            //           Text(
            //             'Needs your smile to be GREEN ',
            //             textAlign: TextAlign.center,
            //             overflow: TextOverflow.ellipsis,
            //             style: const TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Colors.green,
            //               fontFamily: 'Poppins',
            //               fontSize: 16.0,
            //             ),
            //           ),
            //           IconButton(
            //               onPressed: (){
            //                 smileAppValueNotifier.updateShowCountDown(showCoundown: true);
            //                 Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
            //               },
            //               icon: Icon(FontAwesomeIcons.play,color: Colors.green,)),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _smileGramLeaderboar() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          SizedBox(height: 10,),
           ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: 20,
            separatorBuilder: (context, index) {
              return SizedBox(height: 4.0);
            },
            itemBuilder: (context, index) {
              //  return Text(" This is index $index");
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
                        Text("${index + 1}",),
                        SizedBox(width: 5,),
                        Text("Name $index"),
                        SizedBox(width: 10,),
                        Icon(FontAwesomeIcons.star, color: Theme.of(context).primaryColor,),
                     //   Icon(Icons.card_giftcard_rounded, color: Colors.white,),
                        SizedBox(width: 20,),
                        Text("${index * 10}%"),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
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

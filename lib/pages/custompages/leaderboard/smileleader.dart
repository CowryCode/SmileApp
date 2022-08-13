import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/doctor.dart' as model;
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart' as leaderboard;
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:SmileApp/models/user.dart';
import 'package:SmileApp/pages/custompages/leaderboard/tribeleader_widget.dart';
import 'package:SmileApp/widgets/doctorsWidget.dart';
import 'package:SmileApp/widgets/searchWidget.dart';
class LeadderBoard extends StatefulWidget {
  // final User currentUser=User.init().getCurrentUser();
 // final LeaderBoardModel leaderBoardModel = LeaderBoardModel.init().getCurrentLeaderBoardModel();
  @override
  _LeadderBoardState createState() => _LeadderBoardState();
}

class _LeadderBoardState extends State<LeadderBoard> {
 // model.DoctorsList doctorsList;
  List<LeaderBoardModel> leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
  @override
  void initState() {
  //  this.doctorsList = new model.DoctorsList();
  //  _leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
    print("THE SIZE IS ${leaderBoardModelLIST.length}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            'LeaderBoard',
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
              Tab(icon: Icon(FontAwesomeIcons.faceSmileBeam,color: Colors.white,semanticLabel: "Smile Gram",)),
            //  Tab(icon: Icon(FontAwesomeIcons.message, color: Colors.white,semanticLabel: "Pocket Buddy",)),
              Tab(icon: Icon(FontAwesomeIcons.peopleGroup,color: Colors.white,semanticLabel: "My Tribe",)),
            ],
          ),
        ),

        body:TabBarView(
          children: [
            _smileGramLeaderboar(),
           //  Icon(FontAwesomeIcons.faceSmileBeam,color: Colors.green,semanticLabel: "Smile Gram",),
          //  Icon(FontAwesomeIcons.message, color: Colors.green,semanticLabel: "Pocket Buddy",),
            _tribeLeaaderBoard(),
           // Icon(FontAwesomeIcons.peopleGroup,color: Colors.green,semanticLabel: "My Tribe",),
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
                        Text("${index + 1}"),
                        SizedBox(width: 5,),
                        Text("Name $index"),
                        SizedBox(width: 10,),
                        Icon(FontAwesomeIcons.star, color: Colors.white,),
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

  Widget _tribeLeaaderBoard(){

    return ListView.builder(
        itemCount: leaderBoardModelLIST.length,
        itemBuilder: (BuildContext context, int index) {
          return TribeLeaderCardWidget(
                              leader: leaderBoardModelLIST.elementAt(index),
                            );

        });
  }

}

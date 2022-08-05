import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart' as model;
import 'package:medico/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:medico/models/user.dart';
import 'package:medico/pages/custompages/leaderboard/tribeleader_widget.dart';
import 'package:medico/pages/custompages/tribe_message_widget.dart';
import 'package:medico/widgets/doctorsWidget.dart';
import 'package:medico/widgets/searchWidget.dart';



class TribeMessageList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _TribeMessageListState createState() => _TribeMessageListState();
}

class _TribeMessageListState extends State<TribeMessageList> {
 // model.DoctorsList doctorsList;
  List<LeaderBoardModel> _leaderBoardModelLIST;
  @override
  void initState() {
    //this.doctorsList = new model.DoctorsList();
    _leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
          ,
          onPressed: (){
            Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name,widget.currentUser.phoneNumber]);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Tribe Messages',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 20,
                  padding: const EdgeInsets.only(top:0,left:12.0,right: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 0.0,left: 12.0,right: 12.0),
                //   child:SearchBarWidget(),
                // ),
              ],
            ),

             //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
             Flexible(
               child: ListView.builder(
                itemCount: _leaderBoardModelLIST.length,
                itemBuilder: (BuildContext context, int index) {
                  return TribeMessageCardWidget(
                    leader: _leaderBoardModelLIST.elementAt(index), );
                }),
             ),

          ],
        ),

    );
  }

}

import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart' as model;
import 'package:medico/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:medico/models/user.dart';
import 'package:medico/pages/custompages/leaderboard/tribeleader_widget.dart';
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
          'Doctors',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child:Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 0.0,left: 12.0,right: 12.0),
                  child:SearchBarWidget(),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ListView.builder(
                  itemCount: _leaderBoardModelLIST.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TribeLeaderCardWidget(
                      leader: _leaderBoardModelLIST.elementAt(index),
                            );
                  }),

              // ListView.separated(
              //   shrinkWrap: true,
              //   primary: false,
              //  // itemCount: doctorsList.doctors.length,
              //   itemCount: _leaderBoardModelLIST.length,
              //   separatorBuilder: (context,index){
              //     return SizedBox(height: 4.0);
              //   },
              //   itemBuilder: (context,index){
              //     return DoctorsCardWidget(
              //       doctors: doctorsList.doctors.elementAt(index),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

}

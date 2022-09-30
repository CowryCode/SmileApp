import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:SmileApp/models/mymodels/user.dart';
import 'package:SmileApp/pages/custompages/leaderboard/tribeleader_widget.dart';
import 'package:SmileApp/pages/custompages/tribe_pending_task_widget.dart';



class TribePendingTaskList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _TribePendingTaskListState createState() => _TribePendingTaskListState();
}

class _TribePendingTaskListState extends State<TribePendingTaskList> {

 List<LeaderBoardModel>? _leaderBoardModelLIST;
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
          'Share Empathy',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('My Tribe',),
              content: const Text('Get beautiful messages from across the world. Will you want to continue ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.popAndPushNamed(context, '/emotions');
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(FontAwesomeIcons.peopleGroup),
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
              ],
            ),

             //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
             Flexible(
               child: ListView.builder(
                itemCount: _leaderBoardModelLIST!.length,
                itemBuilder: (BuildContext context, int index) {
                  return TribePendingTaskWidget(
                    leader: _leaderBoardModelLIST!.elementAt(index), );
                }),
             ),

          ],
        ),

    );
  }

}

import 'package:SmileApp/pages/custompages/tribes/tribe_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:SmileApp/models/mymodels/user.dart';


class TribePage extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _TribePageState createState() => _TribePageState();
}

class _TribePageState extends State<TribePage> {

 //List<LeaderBoardModel> _leaderBoardModelLIST;
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
          'Empathic Messages',
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
                  return TribePageWidget(
                    leader: _leaderBoardModelLIST!.elementAt(index), );
                }),
             ),

          ],
        ),

    );
  }

}

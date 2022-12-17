import 'package:SmileApp/apis/models/triberequest.dart';
import 'package:SmileApp/pages/custompages/tribe_pending_task_widget.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/leaderboardmodel.dart';
import 'package:SmileApp/models/mymodels/user.dart';
import 'package:rating_dialog/rating_dialog.dart';

class TribePage extends StatefulWidget {
  final User currentUser = User.init().getCurrentUser();

  @override
  _TribePageState createState() => _TribePageState();
}

class _TribePageState extends State<TribePage> {
  @override
  void initState() {
    // _leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
    messageNotifier.update(message: "", index: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).pushNamed('/home', arguments: [
              widget.currentUser.name,
              widget.currentUser.phoneNumber
            ]);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Share Empathy',
          style: TextStyle(
            fontSize: 22.0,
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
              title: const Text(
                'My Tribe',
                style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
              ),
              content: const Text(
                  'Get beautiful messages from other users. Will you want to continue ?',
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
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
                padding: const EdgeInsets.only(top: 0, left: 12.0, right: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),

          //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
          ValueListenableBuilder(
              valueListenable: tribeEmpathyRequestNotifier,
              builder: (context, List<TribeRequest> value, child) {
                if ((value.length < 1)) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 200),
                        child: Text(" No Request to reply to yet"),
                      );
                } else {
                  return Flexible(
                        child: ListView.builder(
                            // itemCount: _leaderBoardModelLIST.length,
                            itemCount: value.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TribePendingTaskWidget(msg: value[index]);
                            }),
                      );
                }
              }),
        ],
      ),
    );
  }
}

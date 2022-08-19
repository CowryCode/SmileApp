import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/doctor.dart' as model;
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';



class TribePageWidget extends StatefulWidget {
  final LeaderBoardModel leader;
  const TribePageWidget({Key key, this.leader}) : super(key: key);

  @override
  _TribePageWidgetState createState() => _TribePageWidgetState();
}

class _TribePageWidgetState extends State<TribePageWidget> {

  bool showfulltext = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        SizedBox(width: 20,),
        Container(
          // height: 150.0,
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.all(6.0),
          child:FlatButton(
            highlightColor: Theme.of(context).primaryColor,
            onPressed: (){
              setState(() {
                showfulltext = !showfulltext;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Card(
              elevation:0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
                  ],
                ),
                padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Message from Someone in Australia ${widget.leader.name}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //TODO: Color this button
                    TextButton(
                        onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Smile Gram'),
                              content: const Text('To read this you need to maintain smile for few seconds'),
                              actions: <Widget>[
                                TextButton(
                                  //  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: (){
                                    // SGMessage sgMSG = SGMessage(content: '${widget.leader.name}', updated: true, tokenIndex: 0);
                                    // StoreProvider.of<MyAppState>(context).dispatch(
                                    //     UpdateSGmessageAction(sgMSG)
                                    // );
                                    Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: ['${widget.leader.name}', true]);
                                  },
                                  child: const Text('Continue'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Respond"),
                            SizedBox(width: 20,),
                            Icon(FontAwesomeIcons.envelope),
                          ],
                        ),
                    )

                  ],
                ),
                //   ],
                // ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget ball(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,
        ),

      ),

    );
  }
}
import 'package:SmileApp/config/custom_design.dart';
import 'package:SmileApp/models/mymodels/smilemodels/giftvariableobject.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';



class TribePageWidget extends StatefulWidget {
  final LeaderBoardModel leader;
  const TribePageWidget({Key? key, required this.leader}) : super(key: key);

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
                        style: CustomeStyling().customContenttext(),

                        // TextStyle(
                        //   fontFamily: 'Poppins',
                        //   fontSize: 12.0,
                        //   fontWeight: FontWeight.bold,
                        //   color: Colors.black45,
                        // ),
                      ),
                    ),
                    //TODO: Color this button
                    TextButton(
                        onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Smile Gram'),
                              content: const Text('To read this you need to maintain smile for few seconds',
                                style: TextStyle(color: Colors.black45),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  //  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel', ),
                                ),
                                TextButton(
                                  onPressed: (){
                                   // GiftVariableObject giftobject = GiftVariableObject(fulltext: "${widget.leader.name}", readmessage: true);
                                  //  Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: giftobject);
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Respond',
                                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Icon(FontAwesomeIcons.envelope, color: Theme.of(context).colorScheme.secondary,),
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
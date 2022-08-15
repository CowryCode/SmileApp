import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/doctor.dart' as model;
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';



class TribePendingTaskWidget extends StatefulWidget {
  final LeaderBoardModel leader;
  const TribePendingTaskWidget({Key key, this.leader}) : super(key: key);

  @override
  _TribePendingTaskWidgetState createState() => _TribePendingTaskWidgetState();
}

class _TribePendingTaskWidgetState extends State<TribePendingTaskWidget> {

  bool showfulltext = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        SizedBox(width: 20,),
        Container(
          // height: 150.0,
          height: MediaQuery.of(context).size.height * 0.25,
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
                        '${widget.leader.name}',
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
                          setState(() {
                            showfulltext = !showfulltext;
                          });
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
        Visibility(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '200 Character empathic messsage',
                  ),
                ),
                TextButton(
                    onPressed: (){
                      setState(() {
                        showfulltext = !showfulltext;
                      });
                    },
                    child: Text("Send", style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
                )
              ],
            ),
            // child: Text(
            //   '${widget.leader.name} ',
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontSize: 12.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
          visible: showfulltext,
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
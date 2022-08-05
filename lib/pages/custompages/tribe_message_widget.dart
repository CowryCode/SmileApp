import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medico/models/doctor.dart' as model;
import 'package:medico/models/mymodels/smilemodels/leaderboardmodel.dart';



class TribeMessageCardWidget extends StatefulWidget {
  final LeaderBoardModel leader;
  const TribeMessageCardWidget({Key key, this.leader}) : super(key: key);

  @override
  _TribeMessageCardWidgetState createState() => _TribeMessageCardWidgetState();
}

class _TribeMessageCardWidgetState extends State<TribeMessageCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150.0,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.all(6.0),
      child:FlatButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: (){
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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ball(widget.leader.avartar,Colors.transparent),
                    Text(
                      'STATE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '9:30AM - 8:00PM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
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
                        Container(
                          width: 160.0,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:Text(
                            'TTTTTTTT${widget.leader.percentage}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color:Colors.grey,
                                fontSize: 10.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.thumbsUp),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.monitor_heart_outlined),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.person),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                            },
                          ),
                        ]
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
import 'package:SmileApp/config/custom_design.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';



class TribeLeaderCardWidget extends StatefulWidget {
  final LeaderBoardModel leader;
  const TribeLeaderCardWidget({Key? key, required this.leader}) : super(key: key);

  @override
  _TribeLeaderCardWidgetState createState() => _TribeLeaderCardWidgetState();
}

class _TribeLeaderCardWidgetState extends State<TribeLeaderCardWidget> {

  bool showfulltext = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget> [
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
                          style: CustomeStyling().customContenttext(),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(FontAwesomeIcons.thumbsUp),
                                  color: Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                  },
                                ),
                                Text(
                                  //TODO: THIS WILL BE UPDATED FROM DB (IF IT'S MORE THAN 1000 CONVERT IT IN K)
                                  '5k',
                                  style: CustomeStyling().customContenttext(),
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(FontAwesomeIcons.heart),
                                  color: Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                  },
                                ),
                                Text(
                                  //TODO: THIS WILL BE UPDATED FROM DB (IF IT'S MORE THAN 1000 CONVERT IT IN K)
                                  '2.3k',
                                  style: CustomeStyling().customContenttext(),
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(FontAwesomeIcons.envelopeOpen),
                                  color: Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                  },
                                ),
                                Text(
                                  //TODO: THIS WILL BE UPDATED FROM DB (IF IT'S MORE THAN 1000 CONVERT IT IN K)
                                  '600',
                                  style: CustomeStyling().customContenttext(),
                                ),
                              ],
                            ),
                          ]
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
              child: Text(
                  '${widget.leader.name} ',
                  textAlign: TextAlign.left,
                  style: CustomeStyling().customContenttext(),
                ),
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

import 'package:flutter/material.dart';
class GetStarted1 extends StatefulWidget {
  @override
  _GetStarted1State createState() => _GetStarted1State();
}

class _GetStarted1State extends State<GetStarted1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12.0,right: 12.0,),
            child: Image(
              image: AssetImage('images/f1.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              'Search Doctors',
                style: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  fontFamily: "Poppins"
                ),
              ),
              Text(
                'Get list of best doctor \n nearby you',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    fontFamily: "Poppins"
                  ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 12.0,right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: (){
                     Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color:Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontFamily: "Poppins"
                    ),
                    ),
                ),
                Row(children: <Widget>[
                  Container(
                    width: 50,
                    height: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    width: 50,
                    height: 3,
                    color: Color(0xdddddddd),
                  ),
                  Container(
                    width: 50,
                    height: 3,
                    color: Color(0xdddddddd),
                  ),
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget step({required String step, required String content, required bool isHeader}){
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        //color: Theme.of(context).accentColor.withOpacity(0.8),
          color: (isHeader)? Colors.orange :  Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15) , bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if(!isHeader) new Text('$step', style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text('$content', style: TextStyle(fontFamily: 'Poppins',color: Theme.of(context).primaryColor),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
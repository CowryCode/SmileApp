import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medico/apis/Variables.dart';

class Home extends StatefulWidget {
  final String value;
  const Home( {Key key, this.value}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 80,
                padding: const EdgeInsets.only(left:20.0,right: 20.0, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                  // color: Theme.of(context).accentColor,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${Variables().AppName}',
                          style: TextStyle(
                            fontSize:22.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "${widget.value}",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                padding: const EdgeInsets.only(left: 30.0 , right: 30.0),
              ),
            ],
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              // Navigator.of(context).pushNamed('/doctorProfil');
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Smile Gram'),
                  content: const Text('This action will help you create wonderful '
                      'image with your smile, do you want to continue?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.popAndPushNamed(context, '/doctorProfil');
                       },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
                // image: DecorationImage(
                //   image:AssetImage('images/custom/smilegram.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.faceSmileBeam,color: Theme.of(context).primaryColor, size: 60,),
                  SizedBox(width: 10,),
                  Text("Smile-Gram",style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              // Navigator.of(context).pushNamed('/doctorProfil');
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Pocket Buddy'),
                  content: const Text('Do you want to chat with the AI bot ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.popAndPushNamed(context, '/chat');
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
                // image: DecorationImage(
                //   image:AssetImage('images/custom/smilegram.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.message,color: Theme.of(context).primaryColor, size: 60,),
                  SizedBox(width: 10,),
                  Text("Pocket Buddy",style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          TextButton(
            onPressed: (){
              // Navigator.of(context).pushNamed('/doctorProfil');
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('My Tribe'),
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
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(width:  1.0 , color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.0),
                // image: DecorationImage(
                //   image:AssetImage('images/custom/smilegram.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.peopleGroup,color: Theme.of(context).primaryColor, size: 60,),
                  SizedBox(width: 30,),
                  Text("My Tribe",style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Text(
                    'Unread SmilePacks',
                    style: TextStyle(
                    fontSize:12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).focusColor
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/doctors");
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                    fontSize:12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 180.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                card("images/asset-1.png","Dr.Alina james","B.Sc DDVL Demilitologist","4.2"),
                card("images/asset-2.png","Dr.Steve Robert","B.Sc DDVL Demilitologist","3.6"),
                card("images/asset-3.png","Dr. Senila Aaraf","B.Sc DDVL Demilitologist ","4.3"),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
  Widget ball(String image,Color color){
    return Container(
      height: 80,width: 80.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget ballcard(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,),
      ),
    );
  }
  Widget card(String image,String title,String subTitle,String rank){
    return 
     Stack(
     children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow( color: Theme.of(context).primaryColor .withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)],
        ),
        width: 140.0,
        height: 140.0,
        child: Card(
          elevation: 0.2,
          child: Wrap(
            children: <Widget>[
              Container(
                margin:EdgeInsets.symmetric(horizontal: 0.0,vertical:40.0),
                child:ListTile(
                  title: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  subtitle: Column(
                    children: <Widget>[
                      Text(
                        subTitle,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10.0
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,color: Colors.yellow,),
                          Text(rank,style: TextStyle(fontFamily: 'Poppins',),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        Container(
          margin:EdgeInsets.symmetric(horizontal: 30.0,vertical:0.0),
          child:ballcard(image,Colors.transparent),
        ),
     ],
    );

  }
}
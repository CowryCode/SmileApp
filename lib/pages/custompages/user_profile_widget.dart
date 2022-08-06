
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:medico/models/user.dart';
import 'package:medico/pages/custompages/redux/app_state.dart';

class PatientAcountWidget extends StatefulWidget {

 // final List<String> acountInfos;

  const PatientAcountWidget({Key key}) : super(key: key);
  @override
  _PatientAcountWidgetState createState() => _PatientAcountWidgetState();
}

class _PatientAcountWidgetState extends State<PatientAcountWidget> {
  //User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(  
              height: 160,
              padding:EdgeInsets.all(12.0),
              margin:EdgeInsets.only(top: 40.0,left: 12.0,right: 12.0),
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16.0),
               color: Theme.of(context).accentColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(12.0),
                    child:Icon(Icons.perm_identity,size: 25,
                        color: Theme.of(context).primaryColor
                    ),
                  ),    
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ball("images/imageuser.png", Colors.transparent),
                         Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                   color: Theme.of(context).primaryColor,
                                ),
                                width: 70,
                                height: 4,

                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.indigo,
                                  ),
                                  height: 4,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: RaisedButton(
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: (){
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                child:  Center(
                                  child:Text(
                                    'You have 2 pending tasks',
                                    style:  TextStyle(
                                      fontSize: 15.0,
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ),
                            ),
                        ],
                      ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(12.0),
                    child:Icon(Icons.settings,size: 25.0,color: Theme.of(context).primaryColor,)
                  )
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.all(12.0),
              margin:EdgeInsets.all(12.0),
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16.0),
               border: Border.all(width: 1,color: Colors.grey.withOpacity(0.2)),
               color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: <Widget>[
                  _dropDownListe(Icon(Icons.calendar_today,color: Theme.of(context).colorScheme.secondary,),'Pending Tasks (2)',1,'/mydoctors',context),
                  _dropDownListe(Icon(Icons.bubble_chart,color: Theme.of(context).colorScheme.secondary,),'Achievements',1,'/leaderboard',context),
                   //TODO: THIS WILL HAVE LIST OF MESSAGES USER HAVE SENT WITH THE FOLLOWING PROPERTIES (Number of people who read it, countries, likes, Feedback)
                   _dropDownListe(Icon(Icons.card_giftcard,color: Theme.of(context).colorScheme.secondary,),'Tribe Call',1,'/tribependingtasks',context),
                  // _dropDownListe(Icon(Icons.local_offer,color: Theme.of(context).colorScheme.secondary,),'Services',1,'/services',context),
                  // _dropDownListe(Icon(Icons.payment,color: Theme.of(context).colorScheme.secondary,),'Support',1,'',context),
                  // _dropDownListe(Icon(Icons.payment,color: Theme.of(context).colorScheme.secondary,),'Payment Methods',1,'',context),
                  _dropDownListe(Icon(Icons.arrow_upward,color: Theme.of(context).colorScheme.secondary,),'Logout',0,'/signup',context),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
Widget _dropDownListe(Icon icon ,String title,double borderWidth,String route,BuildContext context){
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom:BorderSide(width: borderWidth ,color: Colors.grey.withOpacity(0.2))),
    ),
    child: FlatButton(
      onPressed: (){
        Navigator.of(context).pushNamed(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 25.0),
                child: icon,
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 16.0,

                  ),

                ),
              ),
            ],
          ),
          Container(
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget ball(String image,Color color){
    return Container(
      height: 70,width: 70.0,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image:AssetImage(image), fit: BoxFit.cover,
        ),
      ),
    );
  }
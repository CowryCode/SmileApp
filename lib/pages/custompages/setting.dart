
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {

  final List<String>? acountInfos;

  const Setting({Key? key, this.acountInfos}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigateTabsWidget(showEmotionalert: false)));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180.0,
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
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //ball("images/imageuser.png", Colors.transparent),
                          Column(
                            children: <Widget>[
                              Text("SmileGram",style:TextStyle(color:Theme.of(context).primaryColor,fontFamily: 'Poppins', fontSize:30, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Text("Kindly complete your daily tracker to help us improve the SmileApp",style:TextStyle(color:Theme.of(context).primaryColor,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                   color: Theme.of(context).primaryColor,
                                ),
                                width: 260,
                                height: 4,

                              ),
                              // Expanded(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(12.0),
                              //       color: Colors.indigo,
                              //     ),
                              //     height: 4,
                              //   ),
                              // ),
                            ],
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
                    _dropDownListe(Icon(Icons.bubble_chart,color: Theme.of(context).colorScheme.secondary,),'Daily Questionnaire',1,'/questionnaire',context),
                    _dropDownListe(Icon(Icons.calendar_today,color: Theme.of(context).colorScheme.secondary,),'How to use SmileApp',1,'/welcome',context),
                    // _dropDownListe(Icon(Icons.card_giftcard,color: Theme.of(context).colorScheme.secondary,),'Health Tips',1,'/health',context),
                    // _dropDownListe(Icon(Icons.local_offer,color: Theme.of(context).colorScheme.secondary,),'Services',1,'/services',context),
                    // _dropDownListe(Icon(Icons.payment,color: Theme.of(context).colorScheme.secondary,),'Support',1,'',context),
                    // _dropDownListe(Icon(Icons.payment,color: Theme.of(context).colorScheme.secondary,),'Payment Methods',1,'',context),
                    _dropDownListe(Icon(Icons.arrow_upward,color: Theme.of(context).colorScheme.secondary,),'Logout',0,'/',context, logout: true),
                  ],
                ),
              ),
            ],
          ),
        )
    ),
      );
  }
}
Widget _dropDownListe(Icon icon ,String title,double borderWidth,String route,BuildContext context, {bool logout = false}){
  if(logout == true) ApiAccess().Logout();
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
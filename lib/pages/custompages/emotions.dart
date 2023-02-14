import 'dart:math';

import 'package:SmileApp/apis/network.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/user.dart';
import 'package:sizer/sizer.dart';

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

int randomColorstate() {
  Random random = new Random();
  return random.nextInt(100);
}

class Emotions extends StatefulWidget {
  @override
  _EmotionsState createState() => _EmotionsState();
}

class _EmotionsState extends State<Emotions> {
  User currentUser = new User.init().getCurrentUser();

  bool? isClicked;
  bool firstClicked = false;
  bool Clicked0 = false;
  bool Clicked1 = false;
  bool Clicked2 = false;
  bool Clicked3 = false;
  bool Clicked4 = false;
  bool Clicked5 = false;
  bool Clicked6 = false;

  Color? color0;
  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  Color? color5;
  Color? color6;



  @override
  initState() {
    super.initState();
    color0 = randomColor();
    color1 = randomColor();
    color2 = randomColor();
    color3 = randomColor();
    color4 = randomColor();
    color5 = randomColor();
    color6 = randomColor();
    isClicked = false;
  }

  void changeColor() {
    setState(() {
     // color = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            // Navigator.of(context).pushNamed('/home', arguments:[currentUser.name,currentUser.phoneNumber]);
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'My Tribe',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8 ,
          width: MediaQuery.of(context).size.width * 80,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            elevation: 1,
            color: Theme.of(context).colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: EdgeInsets.only(top: 10.sp, left: 5.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Kindly select all that apply ",
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Container(
                        child: Text(
                          "I feel. . .",
                          style: TextStyle(
                              fontSize: 16.0.sp,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                   // SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        buttonAction(clicked: Clicked0, index: 0, label: "Not Happy", buttonicon:FontAwesomeIcons.squarePersonConfined ),
                        buttonAction(clicked: Clicked1, index: 1, label: "Surprised", buttonicon:FontAwesomeIcons.faceTired ),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buttonAction(clicked: Clicked2, index: 2, label: "Fearful", buttonicon: FontAwesomeIcons.faceSmileBeam),

                        buttonAction(clicked: Clicked3, index: 3, label: "Sad", buttonicon: FontAwesomeIcons.faceDizzy),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buttonAction(clicked: Clicked4, index: 4, label: "Angry" , buttonicon: FontAwesomeIcons.faceFrown),

                        buttonAction(clicked: Clicked5, index: 5, label: "Disgusted", buttonicon: FontAwesomeIcons.faceFlushed),

                      ],
                    ),
                  ]),
                  //  SizedBox(height: 20),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        child: TextButton(
                            onPressed: (){
                              String useremotions = getOptions() ?? "";
                              print('Emotions : $useremotions');
                              ApiAccess().requestEmpatheticMessage(emotions: useremotions);
                             _showAlert(context: context);
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                        visible: Clicked0 == true || Clicked1 == true || Clicked2 == true || Clicked3 == true || Clicked4 == true || Clicked5 == true
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton buttonAction({required bool clicked, required int index, required String label, required IconData buttonicon}){
   // print('CLICKED ON : $index ?  $clicked');

    return TextButton(
     key: Key("$index"),
      onPressed: () {
        clickedButton(index: index);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
         // color: Clicked0 == true
          color: clicked == true
              ? Colors.green
              : Colors.white,
          // color: Theme.of(context).primaryColor,
          border: Border.all(
              width: 1.0.w,
              color: Colors.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                buttonicon,
               // FontAwesomeIcons.squarePersonConfined,
                color:
                Theme.of(context).colorScheme.secondary,
                size: 20.sp,
              ),
            ),

            Text(
             "$label",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getEomtionsWidget(String feeling, IconData iconData, int buttonID, bool isclicked) {
    Color? newColor;
    switch(buttonID){
      case 0:
        newColor = Colors.yellow;
        break;
      case 1:
        newColor = Colors.green;
        break;
      case 2:
        newColor = Colors.red;
        break;

    }
    return TextButton(
      onPressed: () {
        // changeColor();
        setState(() {
          newColor = randomColor();
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.40,
        // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
        decoration: BoxDecoration(
          color: newColor,
          // color: Theme.of(context).primaryColor,
          border: Border.all(width: 1.0, color: Colors.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Icon(
              iconData,
              color: Theme.of(context).colorScheme.secondary,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              feeling,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }


  _showAlert({required BuildContext context,}){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('My Tribe'),
        content: const Text('Message sent, community members will reach out to you',
          style: TextStyle(color: Colors.black45),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed('/home');
            },
            child: const Text('Ok', ),
          ),
        ],
      ),
    );
  }

  void clickedButton({required int index}){
    if(index == 0){
      setState(() {
        Clicked0 = !Clicked0;
      });
    }
    if(index == 1){
      setState(() { Clicked1 = !Clicked1;});
    }
    if(index == 2){
      setState(() { Clicked2 = !Clicked2;});
    }
    if(index == 3){
      setState(() { Clicked3 = !Clicked3;});
    }
    if(index == 4){
      setState(() { Clicked4 = !Clicked4;});
    }
    if(index == 5){
      setState(() { Clicked5 = !Clicked5;});
    }
  }

  String? getOptions(){
    try{
    String options = "" ;
    if(Clicked0 == true){
      options = options + "not happy888";
    }
    if(Clicked1 == true){
      options = options + "surprised888";
    }
    if(Clicked2 == true){
      options = options + "fearful888";
    }
    if(Clicked3 == true){
      options = options + "sad888";
    }
    if(Clicked4 == true){
      options = options + "angry888";
    }
    if(Clicked5 == true){
      options = options + "disgusted888";
    }

    List<String> strArray = options.split("888");

    print('ARRAY SIZE : ${strArray.length}');

      if(strArray.length < 2) return null;
    if(strArray.length == 2) return strArray[0];

    String result = strArray[0];
    for(int x = 1; x < strArray.length - 2; x++){
      result = result + ",${strArray[x]}";
    }
    result = result + " and ${strArray[strArray.length - 2]}";

    return result;
    }catch(e){
      return null;
    }

   // return options;
  }
}

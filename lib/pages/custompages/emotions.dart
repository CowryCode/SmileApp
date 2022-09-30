import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/user.dart';

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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 90,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            elevation: 1,
            color: Theme.of(context).colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Monday 26th April ",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "Wednsday 28th April",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        "Select your dominant emotion(s). \n (Use paper related to emotion)",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked0 == true) {
                                Clicked0 = false;
                              } else {
                                Clicked0 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked0 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.squarePersonConfined,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Comfused ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked1 == true) {
                                Clicked1 = false;
                              } else {
                                Clicked1 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked1 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceTired,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Tired ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked2 == true) {
                                Clicked2 = false;
                              } else {
                                Clicked2 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked2 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceSmileBeam,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Happy ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked3 == true) {
                                Clicked3 = false;
                              } else {
                                Clicked3 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked3 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceDizzy,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Busy ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked4 == true) {
                                Clicked4 = false;
                              } else {
                                Clicked4 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked4 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceFrown,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Stressed ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked5 == true) {
                                Clicked5 = false;
                              } else {
                                Clicked5 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked5 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceFlushed,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Sick ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // changeColor();
                            setState(() {
                              if (Clicked6 == true) {
                                Clicked6 = false;
                              } else {
                                Clicked6 = true;
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
                            decoration: BoxDecoration(
                              color: Clicked6 == true
                                  ? Colors.green
                                  : Colors.white,
                              // color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.faceFlushed,
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Lonely ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  //  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                        ),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).popAndPushNamed('/home');
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
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

  Widget getEomtionsWidget(String feeling, IconData iconData, int buttonID, bool isclicked) {
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
}

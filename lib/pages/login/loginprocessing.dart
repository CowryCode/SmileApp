import 'dart:async';

import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:flutter/material.dart';
class LoginProcessing extends StatefulWidget {
  bool justLoggedin;
  final GiftVariableObject giftVariableObject;
  LoginProcessing({required this.justLoggedin,required this.giftVariableObject});

  @override
  _LoginProcessingState createState() => _LoginProcessingState();
}

class _LoginProcessingState extends State<LoginProcessing> {

  //bool? loginStatus;
  //bool justLoggedin = false;
  Future<UserProfile>? profile;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      profile  = ApiAccess().login(logincode: widget.giftVariableObject.msg!);
      profile!.then((value) => {
        if(value != null){
          print('Logged in Successfully Initialized'),
          Navigator.of(context).popAndPushNamed('/home_with_alert')
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/logo1.jpeg'),
            //fit: BoxFit.cover,
            fit: BoxFit.fitWidth,
            ),
        ),
       child:   FutureBuilder<UserProfile>(
            future: profile,
            builder: (BuildContext context, AsyncSnapshot<UserProfile> snapshot){
              Timer.periodic(Duration(seconds: 10), (timer){
                //if (timer.tick == 1) {
                  if (snapshot.hasData) {
                    timer.cancel();
                    ((){
                      return Navigator.of(context).popAndPushNamed('/home_with_alert');
                    }());
                  } else {
                    if(widget.justLoggedin == true && !snapshot.hasData ){
                      timer.cancel();
                      print("Timer tick is ${timer.tick}");
                      widget.justLoggedin = false;
                      showAlertDialog(context: context,
                          title: "Failed Login",
                          message: "Couldn't login at this point, kindly wait for few minutes and try again",
                          gotTologin: true);
                    }else{
                      timer.cancel();
                    }
                  }
               // }
              });
              return Container(
                child: Center(child: CircularProgressIndicator(),),
              );
            },
          ) ,
        // child: Container(
        //   decoration: BoxDecoration(
        //    // color: Theme.of(context).accentColor.withOpacity(0.8), // Original code
        //     color: Theme.of(context).colorScheme.secondary.withOpacity(0.7), // My code
        //   ),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Container(
        //           margin: EdgeInsets.all(12.0),
        //           child: Text(
        //             // 'Welcome To \n healthconsult',
        //             'Welcome to the SmileApp \n \n Swipe left to continue. . .',
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               color:Theme.of(context).primaryColor.withOpacity(0.8),
        //               fontWeight: FontWeight.bold,
        //               fontSize: 30.0,
        //               fontFamily: "Poppins"
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }


  showAlertDialog({required BuildContext context, required String title, required String message, required bool gotTologin}) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: (){
       // Navigator.of(context).pushNamed('/');
        setState(() {
          widget.justLoggedin == false;
        });
        Navigator.of(context).popAndPushNamed('/');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
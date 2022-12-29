import 'dart:async';

import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/pages/instructions/Welcome.dart';
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

  Timer? _timer;


  @override
  void dispose() {
    print('DISPOSED CALLED @ 123');
    _timer!.cancel();
  }

  @override
  void initState() {

    _timer = Timer.periodic(Duration(seconds: 10), (timer) { });


    WidgetsBinding.instance.addPostFrameCallback((_) async{
      //
      // _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      //
      // });

     profile  =  ApiAccess().login(logincode: widget.giftVariableObject.msg!);
      profile!.then((value) => {
        if(value != null){
          print('Logged in Successfully Initialized'),
          _timer!.cancel(),
        //  Navigator.of(context).popAndPushNamed('/home_with_alert')
          print('WELCOME WAS CALLED HERE 1'),
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()))
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
       child: FutureBuilder<UserProfile>(
            future: profile,
            builder: (BuildContext context, AsyncSnapshot<UserProfile> snapshot){
              if(_timer!.isActive){
                  if (snapshot.hasData) {
                    _timer!.cancel();
                   // ((){
                      print('WELCOME WAS CALLED HERE 2');
                      Future.delayed(Duration.zero, () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome())));
                  //  }());
                  } else {
                    //((){
                      _timer!.cancel();
                    if(_timer!.tick >= 1)  Future.delayed(Duration.zero, () => showAlertDialog(context: context,
                          title: "Failed Login",
                          message: "Couldn't login at this point, kindly wait for few minutes and try again",
                          gotTologin: true));
                    //}());
                  }
                  // }
               // }
              }
              return Container(
                child: Center(child: CircularProgressIndicator(),),
              );
            },
          ) ,
      ),
    );
  }


  showAlertDialog({required BuildContext context, required String title, required String message, required bool gotTologin}) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: (){
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
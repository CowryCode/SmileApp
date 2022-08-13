import 'package:flutter/material.dart';
import 'package:SmileApp/apis/Variables.dart';
class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('images/image-home.jpeg'),
            fit: BoxFit.cover,
            ),
        ),
        child: Container(
          decoration: BoxDecoration(
           // color: Theme.of(context).accentColor.withOpacity(0.8), // Original code
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8), // My code
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Text(
                    // 'Welcome To \n Medico',
                    'Welcome To \n ${Variables().AppName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Theme.of(context).primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/logo1.png'),
            //fit: BoxFit.cover,
            fit: BoxFit.fitWidth,
            ),
        ),
        child: Container(
          decoration: BoxDecoration(
           // color: Theme.of(context).accentColor.withOpacity(0.8), // Original code
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.7), // My code
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Text(
                    // 'Welcome To \n healthconsult',
                    'Welcome to the SmileApp \n \n Swipe left to continue. . .',
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
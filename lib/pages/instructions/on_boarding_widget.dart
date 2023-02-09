import 'package:SmileApp/pages/custompages/navigationtabs.dart';
import 'package:SmileApp/pages/instructions/getStarted1.dart';
import 'package:SmileApp/pages/instructions/getStarted2.dart';
import 'package:SmileApp/pages/instructions/getStarted3.dart';
import 'package:SmileApp/pages/instructions/on_boarding_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _current = 0;
  OnBoardingList? _onBoardingList;
  @override
  void initState() {
    _onBoardingList = new OnBoardingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
               // height: double.maxFinite,
                height: 1300,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, other) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: _onBoardingList!.list.map((OnBoarding boarding) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            boarding.image!,
                            width: 200,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Text(
                                boarding.title!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:Theme.of(context).focusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                  fontFamily: "Poppins"
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            (boarding.featureID! == 1)? _smileGraminstructions() : (boarding.featureID! == 2)? _pocketBuddyinstructions() : _myTribeInstructions() ,
                            SizedBox(height: 10,),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(left: 12.0,right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                   Navigator.of(context).pushNamed('/home_with_alert');
                   Navigator.push(context, MaterialPageRoute(builder: (context) => NavigateTabsWidget(showEmotionalert: true,)));
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
              Container(
              width: 110.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _onBoardingList!.list.map((OnBoarding boarding) {

                  return Text(
                    (_current == 0) ? "1/3" : (_current == 1) ? "2/3" : "3/3",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: "Poppins",
                        color: _current == _onBoardingList!.list.indexOf(boarding)
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).hintColor.withOpacity(0.2)),
                    );

                 return Container(
                    width: 30.0,
                    height: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: _current == _onBoardingList!.list.indexOf(boarding)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).hintColor.withOpacity(0.2)),
                  );

                 return Container(
                   width: 30.0,
                   height: 3.0,
                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(
                         Radius.circular(8),
                       ),
                       color: _current == _onBoardingList!.list.indexOf(boarding)
                           ? Theme.of(context).colorScheme.secondary
                           : Theme.of(context).hintColor.withOpacity(0.2)),
                 );

                }).toList(),
              ),
            ),
            ],
          ),
        ), 
      ),
    );
  }

  Widget _smileGraminstructions(){
    return Column(
      children: <Widget>[
        step(step: "", content: "To play the SmileGram Game. \n Follow the steps below.",isHeader: true),
        step(step: "Step 1:", content: "Click on the SmileGram feature \n from the home screen", isHeader: false),
        step(step: "Step 2:", content: "Wait for the count-down to complete", isHeader: false),
        step(step: "Step 3:", content: "Maintain a smiling face until \n the two icons overlap", isHeader: false),
        step(step: "**", content: "Each time these two icons overlap, a portion of \n the map is painted green",isHeader: false),
        step(step: "**", content: "You can exit at any point by clicking \n the back-arrow button", isHeader: true),
        step(step: "**", content: "Before exiting, rate how you feel \n  after using the feature.", isHeader: true),
      ],
    );
  }

  Widget _pocketBuddyinstructions(){
    return Column(
      children: <Widget>[
        step(step: "", content: "To interact with the Pocketbuddy. \n Follow the steps below.", isHeader: true),
        step(step: "Step 1:", content: "Click on the Pocketbuddy feature \n from the home screen",isHeader: false),
        step(step: "Step 2:", content: "Chat with the buddy",isHeader: false),
        step(step: "**", content: "You can exit at any point by clicking \n the back-arrow button", isHeader: true),
        step(step: "**", content: "Before exiting, rate how you feel \n  after using the feature.", isHeader: true),
      ],
    );
  }

  Widget _myTribeInstructions(){
    return Column(
      children: <Widget>[
        step(step: "", content: "To request for supportive message(s) from other users, follow the steps below.", isHeader: true),
        step(step: "Step 1:", content: "Click on the myTribe feature from the home screen.", isHeader: false),
        step(step: "Step 2:", content: "Select the emotion(s) to best describe how you feel.", isHeader: false),
        step(step: "Step 3:", content: "Click on 'OK' to notify other users of how you are feeling.", isHeader: false),
        step(step: "", content: "To reply to supportive message request from other users, follow the steps below.", isHeader: true),
        step(step: "Step 1:", content: "Click on the 'Group Icon' at bottom center of the navigation bar in the home screen.", isHeader: false),
        step(step: "Step 2:", content: "Click on 'Reply' to any of the request(s), type your message then click on 'Send'.", isHeader: false),
        step(step: "", content: "To read supportive message from other users, follow the steps below.", isHeader: true),
        step(step: "Step 1:", content: "Click on the 'closed envelope' icon on the home screen.", isHeader: false),
        step(step: "Step 2:", content: "Smile to show the content of the supportive message", isHeader: false),
        step(step: "**", content: "You can exit at any point by clicking the back-arrow button.",isHeader: true),
        step(step: "**", content: "Before exiting, rate how you feel after using the feature.", isHeader: true),
      ],
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

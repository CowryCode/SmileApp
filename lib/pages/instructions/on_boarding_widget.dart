import 'package:SmileApp/pages/custompages/navigationtabs.dart';
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
                //height: MediaQuery.of(context).size.height * 0.9,
                height: 1200,
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
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.9,
                            //   //width: 200,
                            //   padding: const EdgeInsets.only(left: 20,right: 20),
                            //   child: Text(
                            //     boarding.description!,
                            //     textAlign: TextAlign.justify,
                            //     style: TextStyle(
                            //       color:Colors.grey,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 18.0,
                            //       fontFamily: "Poppins"
                            //     ),
                            //   ),
                            // ),
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
                    color:Theme.of(context).accentColor,
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
                  return Container(
                    width: 30.0,
                    height: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: _current == _onBoardingList!.list.indexOf(boarding)
                            ? Theme.of(context).accentColor
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
        steps(step: "", content: "To play the SmileGram Game. \n Follow the steps below.",isHeader: true),
        steps(step: "Step 1:", content: "Click on the SmileGram feature \n from the home screen", isHeader: false),
        steps(step: "Step 2:", content: "Wait for the count-down to complete", isHeader: false),
        steps(step: "Step 3:", content: "Maintain a smily face until \n the two moving stars meet", isHeader: false),
        steps(step: "**", content: "Each time these stars meet, a portion of \n the map is painted green",isHeader: false),
        steps(step: "**", content: "You can exit at any point by clicking \n the back-arrow button", isHeader: true),
        steps(step: "**", content: "Before exiting, rate how you feel \n  after using the feature.", isHeader: true),
      ],
    );
  }

  Widget _pocketBuddyinstructions(){
    return Column(
      children: <Widget>[
        steps(step: "", content: "To interact with the Pocketbuddy. \n Follow the steps below.", isHeader: true),
        steps(step: "Step 1:", content: "Click on the Pocketbuddy feature \n from the home screen",isHeader: false),
        steps(step: "Step 2:", content: "Chat with the buddy",isHeader: false),
        steps(step: "**", content: "You can exit at any point by clicking \n the back-arrow button", isHeader: true),
        steps(step: "**", content: "Before exiting, rate how you feel \n  after using the feature.", isHeader: true),
      ],
    );
  }

  Widget _myTribeInstructions(){
    return Column(
      children: <Widget>[
        steps(step: "", content: "To request for supportive message(s) from \n other users, follow the steps below.", isHeader: true),
        steps(step: "Step 1:", content: "Click on the myTribe feature \n from the home screen.", isHeader: false),
        steps(step: "Step 2:", content: "Select the emotion(s) to best \n describe how you feel.", isHeader: false),
        steps(step: "Step 3:", content: "Click on 'OK' to notify other users \n  of how you are feeling.", isHeader: false),
        steps(step: "", content: "To reply to supportive message request \n from other users, follow the steps below.", isHeader: true),
        steps(step: "Step 1:", content: "Click on the 'Group Icon' \n at bottom center of the navigation bar \n in the home screen.", isHeader: false),
        steps(step: "Step 2:", content: "Click on 'Reply' to any of \n the request(s), type your \n message then click on 'Send'.", isHeader: false),
        steps(step: "", content: "To read supportive message from other users, \n follow the steps below.", isHeader: true),
        steps(step: "Step 1:", content: "Click on the 'closed envelope' \n icon on the home screen.", isHeader: false),
        steps(step: "Step 2:", content: "Smile to show the content of \n the supportive message", isHeader: false),
        steps(step: "**", content: "You can exit at any point by clicking \n the back-arrow button.",isHeader: true),
        steps(step: "**", content: "Before exiting, rate how you feel \n  after using the feature.", isHeader: true),
      ],
    );
  }

  Widget steps({required String step, required String content, required bool isHeader}){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 75,
          padding: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            color: (isHeader)? Colors.orange :  Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(""),

        ),
        Positioned(
          left: 10.0,
          top: 7.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              SizedBox(width: 5,),
              Text("$step"),
              SizedBox(width: 10,),
              Text("$content", softWrap: false, overflow: TextOverflow.ellipsis,),
              SizedBox(width: 5,),
            ],
          ),
        )
      ],
    );
  }
}

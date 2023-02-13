import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
import 'package:SmileApp/pages/custompages/leaderboard/globalperformancetable.dart';
import 'package:SmileApp/pages/custompages/leaderboard/performancetable.dart';
import 'package:SmileApp/pages/login/login.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class LeadderBoard extends StatefulWidget {
  // final User currentUser=User.init().getCurrentUser();
 // final LeaderBoardModel leaderBoardModel = LeaderBoardModel.init().getCurrentLeaderBoardModel();
  @override
  _LeadderBoardState createState() => _LeadderBoardState();
}

class _LeadderBoardState extends State<LeadderBoard> {
 // List<LeaderBoardModel>? leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_)=> {
    if(ApiAccess().hasPayLoad() == false) {
        _showNetworkAlert(context: context,
        message: "It seems your device is not connected to \n the internet. Kindly check and login again.")
         }
     });

    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
            //   ,
            //   onPressed: (){
            //    Navigator.of(context).pop();
            //   },
            // ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              'Achievements',
              style: TextStyle(
                fontSize:22.0.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.globe,color: Colors.white,semanticLabel: "Smile Gram",)),
                Tab(icon: Icon(FontAwesomeIcons.trophy,color: Colors.white,semanticLabel: "LeaderBoard",)),
              ],
            ),
          ),

          body:TabBarView(
            children: [
              _map1(),
              GlobalPerformanceTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _map(){
    return Column(
      children: <Widget>[

        HappinessMap(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ValueListenableBuilder(
                // valueListenable: counterNotifier,
                valueListenable: smileAppValueNotifier.value.nextCountry,
                builder: (context, String value, child) {
                  return Text(
                    '   $value',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  );
                },
              ),
              Text(
                'Needs your smile to be GREEN ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
              ),
              IconButton(
                  onPressed: (){
                    smileAppValueNotifier.updateShowCountDown(showCoundown: true);
                    Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: new GiftVariableObject(readmessage: false));
                  },
                  icon: Icon(FontAwesomeIcons.play,color: Colors.green,)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _map1(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 8.h,
                padding: const EdgeInsets.only(top:5,left:12.0,right: 12.0, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Your Smile Map',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: smileAppValueNotifier.value.nextCountry,
                  builder: (context, String value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text(
                          ' Next Country : ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                            fontFamily: 'Poppins',
                            fontSize: 14.0.sp,
                          ),
                        ),
                        Text(
                          ' $value',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.black45,
                      size: 14.sp,
                    ),
                    // SizedBox(
                    //   width: 2,
                    // ),
                    ValueListenableBuilder(
                        valueListenable: smileGameNofitier,
                        builder: (context, SmileGameVariables value, child) {
                          int pending = 175 - value.getSmileNumberofCountriesPainted();
                          return Text(
                            (value.getSmileNumberofCountriesPainted() == null)
                                ? " Pending:"
                                : " Pending:  $pending",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5),
                              fontFamily: 'Poppins',
                              fontSize: 14.0.sp,
                            ),
                          );
                        }),
                   SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      FontAwesomeIcons.solidCircle,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 14.sp,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    ValueListenableBuilder(
                        valueListenable: smileGameNofitier,
                        builder: (context, SmileGameVariables value, child) {
                          return Text(
                            " Completed:  ${value.getSmileNumberofCountriesPainted()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5),
                              fontFamily: 'Poppins',
                              fontSize: 14.0.sp,
                            ),
                          );
                        }),
                  ],
                  //  );
                  //   },
                ),
              ],
            ),
          ),
          HappinessMap(),
        ],
      ),
    );
  }


  _showNetworkAlert({required BuildContext context, required String message,}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
              size: 26,
            )),
        content: Text(
          '$message',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black45,
            fontFamily: 'Poppins',
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          // TextButton( onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK'),),
          TextButton(
            onPressed: () {
              //ApiAccess().Logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

}

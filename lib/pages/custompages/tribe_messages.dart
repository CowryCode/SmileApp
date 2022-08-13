import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/doctor.dart' as model;
import 'package:SmileApp/models/mymodels/smilemodels/leaderboardmodel.dart';
import 'package:SmileApp/models/user.dart';
import 'package:SmileApp/pages/custompages/leaderboard/tribeleader_widget.dart';
import 'package:SmileApp/pages/custompages/tribe_pending_task_widget.dart';
import 'package:SmileApp/widgets/doctorsWidget.dart';
import 'package:SmileApp/widgets/searchWidget.dart';



class TribeMessageList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _TribeMessageListState createState() => _TribeMessageListState();
}

class _TribeMessageListState extends State<TribeMessageList> {


  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor ),
          onPressed: (){
            // Navigator.of(context).pushNamed('/home', arguments:[currentUser.name,currentUser.phoneNumber]);
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Short Notes',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
             onPressed: () {
               showDialog<String>(
                 context: context,
                 builder: (BuildContext context) => AlertDialog(
                   title: const Text('My Tribe',),
                   content: const Text('Get beautiful messages from across the world. Will you want to continue ?'),
                   actions: <Widget>[
                     TextButton(
                       onPressed: () => Navigator.pop(context, 'Cancel'),
                       child: const Text('Cancel'),
                     ),
                     TextButton(
                       onPressed: (){
                         Navigator.popAndPushNamed(context, '/emotions');
                       },
                       child: const Text('Yes'),
                     ),
                   ],
                 ),
               );
             },
             backgroundColor: Theme.of(context).colorScheme.secondary,
             child: const Icon(FontAwesomeIcons.peopleGroup),
      ),
      body: Center(
        child:Container(
          child:CarouselSlider(
            options: CarouselOptions(
              // height: 100,
              height: (MediaQuery.of(context).size.height) * 0.8 ,
              aspectRatio: 16/9,
              viewportFraction: 0.8, initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: <Widget>[
              //TODO: Limit the number of words that will be posted by tribe members
              //TODO: When the number of Tribe messages reaches 10 older once will be deleted
              Card(
                elevation: 1,
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Monday 26th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Wednsday 28th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Neurobics for your mind . ",
                          style: TextStyle(
                              fontSize:28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.thumbsUp),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                            SizedBox(width: 20,),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.heart),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                          ]
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Text(
                      //       "",
                      //       style: TextStyle(
                      //         fontSize:18.0,
                      //         fontFamily: 'Poppins',
                      //         color: Theme.of(context).primaryColor.withOpacity(0.8),
                      //       ),
                      //     ),
                      //     Text(
                      //       "Read more",
                      //       style: TextStyle(
                      //         fontSize:18.0,
                      //         fontFamily: 'Poppins',
                      //         color: Theme.of(context).primaryColor.withOpacity(0.8),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Monday 26th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Wednsday 28th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Brush up on hygiene . ",
                          style: TextStyle(
                              fontSize:28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.thumbsUp),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                            SizedBox(width: 20,),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.heart),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                          ]
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Monday 26th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Wednsday 28th April",
                            style: TextStyle(
                              fontSize:12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Don't skip your breakfast . ",
                          style: TextStyle(
                              fontSize:28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.thumbsUp),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                            SizedBox(width: 20,),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.heart),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ],
            // height: 400, // I commented this out
          ),
        ),
      ),

    );
  }





//  List<LeaderBoardModel> _leaderBoardModelLIST;
 //  @override
 //  void initState() {
 //    //this.doctorsList = new model.DoctorsList();
 //    _leaderBoardModelLIST = LeaderBoardModelLIST().leaderboardlist;
 //    super.initState();
 //  }
 //  @override
 //  Widget build(BuildContext context) {
 //    return Scaffold(
 //      appBar: AppBar(
 //        elevation: 0,
 //        leading: IconButton(
 //          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
 //          ,
 //          onPressed: (){
 //            Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name,widget.currentUser.phoneNumber]);
 //          },
 //        ),
 //        backgroundColor: Theme.of(context).colorScheme.secondary,
 //        title: Text(
 //          'Tribe Messages',
 //          style: TextStyle(
 //            fontSize:22.0,
 //            fontFamily: 'Poppins',
 //            fontWeight: FontWeight.bold,
 //            color: Theme.of(context).primaryColor,
 //          ),
 //        ),
 //
 //      ),
 //      floatingActionButton: FloatingActionButton(
 //        onPressed: () {
 //          showDialog<String>(
 //            context: context,
 //            builder: (BuildContext context) => AlertDialog(
 //              title: const Text('My Tribe',),
 //              content: const Text('Get beautiful messages from across the world. Will you want to continue ?'),
 //              actions: <Widget>[
 //                TextButton(
 //                  onPressed: () => Navigator.pop(context, 'Cancel'),
 //                  child: const Text('Cancel'),
 //                ),
 //                TextButton(
 //                  onPressed: (){
 //                    Navigator.popAndPushNamed(context, '/emotions');
 //                  },
 //                  child: const Text('Yes'),
 //                ),
 //              ],
 //            ),
 //          );
 //        },
 //        backgroundColor: Theme.of(context).colorScheme.secondary,
 //        child: const Icon(FontAwesomeIcons.peopleGroup),
 //      ),
 //      body: Column(
 //          children: <Widget>[
 //            Stack(
 //              children: <Widget>[
 //                Container(
 //                  height: 20,
 //                  padding: const EdgeInsets.only(top:0,left:12.0,right: 12.0),
 //                  decoration: BoxDecoration(
 //                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
 //                    color: Theme.of(context).colorScheme.secondary,
 //                  ),
 //                ),
 //              ],
 //            ),
 //
 //             //TODO: WHEN THERE IS NO MESSAGE TO SHOW, SHOW "No message yet click on the + button to trigger messages"
 //             Flexible(
 //               child: ListView.builder(
 //                itemCount: _leaderBoardModelLIST.length,
 //                itemBuilder: (BuildContext context, int index) {
 //                  return TribeMessageCardWidget(
 //                    leader: _leaderBoardModelLIST.elementAt(index), );
 //                }),
 //             ),
 //
 //          ],
 //        ),
 //
 //    );
 //  }

}

// import 'package:flutter/material.dart';
// import 'package:SmileApp/models/test.dart' as model;
// import 'package:SmileApp/models/user.dart';
// import 'package:SmileApp/widgets/secondTestsWidget.dart';
// class BookTestsOnlineSecondeStep extends StatefulWidget {
//   @override
//   _BookTestsOnlineSecondeStepState createState() => _BookTestsOnlineSecondeStepState();
// }
//
// class _BookTestsOnlineSecondeStepState extends State<BookTestsOnlineSecondeStep> {
//   User currentUser=User.init().getCurrentUser();
//   late model.TestsList testsList;
//   void initState() {
//     this.testsList = new model.TestsList();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
//
//
//          ,
//           onPressed: (){
//             Navigator.of(context).pushNamed('/bookTest');
//           },
//         ),
//         backgroundColor: Theme.of(context).accentColor,
//         title: Text(
//           'Book test & package online ...',
//           style: TextStyle(
//             fontSize:18.0,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                     height: 20,
//                     padding: const EdgeInsets.only(left:0.0,right: 0.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                 Padding(
//                     padding: const EdgeInsets.only(top: 0,left: 12.0,right: 12.0),
//                     child:Container(
//                       padding:EdgeInsets.only(right: 12.0,left: 12.0,bottom: 12.0),
//                       decoration: BoxDecoration(
//                        color: Theme.of(context).primaryColor,
//                        borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Column(
//                         children: <Widget>[
//                           ListView.separated(
//                             padding: EdgeInsets.symmetric(vertical: 15),
//                             shrinkWrap: true,
//                             primary: false,
//                             itemCount:4,
//                             separatorBuilder: (context,index){
//                               return SizedBox(height: 7,);
//                             },
//                             itemBuilder: (context,index){
//                               return TestsSlected(
//                                 tests: testsList.tests.elementAt(index),
//                                 onDismissed: (tests) {
//                                   setState(() {
//                                     testsList.tests.removeAt(index);
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 12.0,right: 17.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Text(
//                                     'Total',
//                                     style: TextStyle(
//                                       fontFamily: 'Poppins',
//                                       fontSize: 16.0,
//                                       color: Theme.of(context).focusColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '145\$',
//                                     style: TextStyle(
//                                       fontFamily: 'Poppins',
//                                       fontSize: 16.0,
//                                       color: Colors.grey,
//                                       //fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//              Container(
//               padding:EdgeInsets.only(right: 0.0,left: 0.0,bottom: 0.0,top: 0),
//               margin:EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 border: Border.all(width: 1,color: Colors.grey.withOpacity(0.6)),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   FlatButton(
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/bookTest');
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)
//                     ),
//                     color: Colors.transparent,
//                     child:Container(
//                       margin: EdgeInsets.only(left: 45.0,right: 45.0,top: 12,bottom: 12),
//                       child:Text(
//                       '+ Add more tests',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           color: Theme.of(context).focusColor,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 0,
//         color: Colors.transparent,
//         child:Container(
//               padding:EdgeInsets.only(right: 0.0,left: 50.0,bottom: 0.0,top: 0),
//               margin:EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 border: Border.all(width: 1,color: Colors.grey.withOpacity(0.6)),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Text(
//                         '1 test Added',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           color: Colors.grey
//                         ),
//                       ),
//                       Text(
//                         '\$ 300',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           color: Theme.of(context).focusColor,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ],
//                   ),
//                   RaisedButton(
//                     elevation: 0,
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/thirdBookTest');
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)
//                     ),
//                     color: Theme.of(context).accentColor,
//                     child:Container(
//                       margin: EdgeInsets.only(left: 45.0,right: 45.0,top: 12,bottom: 12),
//                       child:Text(
//                         'Continue',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           color: Theme.of(context).primaryColor,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ),
//       ),
//     );
//   }
// }
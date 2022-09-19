// import 'package:flutter/material.dart';
// import 'package:SmileApp/models/mymodels/providermodels/patient.dart' as model;
// import 'package:SmileApp/models/user.dart';
// import 'package:SmileApp/widgets/doctorsWidget.dart';
// import 'package:SmileApp/widgets/mywidgets/providerwidgets/mypatientwidget.dart';
// import 'package:SmileApp/widgets/mywidgets/providerwidgets/patientQueueWidget.dart';
// import 'package:SmileApp/widgets/searchWidget.dart';
// class PatientQueueList extends StatefulWidget {
//   final User currentUser=User.init().getCurrentUser();
//   @override
//   _PatientQueueListState createState() => _PatientQueueListState();
// }
//
// class _PatientQueueListState extends State<PatientQueueList> {
//   model.PatientsList patientsList;
//   @override
//   void initState() {
//     this.patientsList = new model.PatientsList();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
//           ,
//           onPressed: (){
//             // Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name,widget.currentUser.phoneNumber]);
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         title: Text(
//           'Patient Queue',
//           style: TextStyle(
//             fontSize:22.0,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//
//       ),
//       body: SingleChildScrollView(
//         child:Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                   height: 20,
//                   padding: const EdgeInsets.only(top:0,left:12.0,right: 12.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
//                     color: Theme.of(context).colorScheme.secondary,
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 0.0,left: 12.0,right: 12.0),
//                 //   child:SearchBarWidget(),
//                 // ),
//               ],
//             ),
//
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//               ),
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: patientsList.patients.length,
//                 separatorBuilder: (context,index){
//                   return SizedBox(height: 4.0);
//                 },
//                 itemBuilder: (context,index){
//                   return PatientQueueCardWidget(
//                     patients: patientsList.patients.elementAt(index),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }

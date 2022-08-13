import 'package:flutter/material.dart';
import 'package:SmileApp/models/doctor.dart' as model;
import 'package:SmileApp/models/mymodels/patientmodels/hospital.dart' as model;

class HospitalsCardWidget extends StatefulWidget {
  final model.Hospital hospitals;
  const HospitalsCardWidget({Key key, this.hospitals}) : super(key: key);

  @override
  _HospitalsCardWidgetState createState() => _HospitalsCardWidgetState();
}

class _HospitalsCardWidgetState extends State<HospitalsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150.0,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(6.0),
      child:FlatButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.of(context).pushNamed('/hospitaldetail');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Card(
          elevation:0.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1), offset: Offset(0,4), blurRadius: 10)
              ],
            ),
            padding: const EdgeInsets.only(top:12.0,bottom: 12.0,left: 12.0,right: 12.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ball(widget.hospitals.avatar,Colors.transparent),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.hospitals.state}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: this.widget.hospitals.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          '9:30AM - 8:00PM',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Container(
                //           margin: const EdgeInsets.only(bottom: 6.0),
                //           child: Text(
                //             '${widget.doctors.name}',
                //             textAlign: TextAlign.left,
                //             style: TextStyle(
                //               fontFamily: 'Poppins',
                //               fontSize: 12.0,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           width: 160.0,
                //           padding: const EdgeInsets.all(6.0),
                //           decoration: BoxDecoration(
                //             border: Border.all(width: 1,color: Colors.grey.withOpacity(0.1)),
                //             borderRadius: BorderRadius.circular(12),
                //           ),
                //           child:Text(
                //             '${widget.doctors.description}',
                //             style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 color:Colors.grey,
                //                 fontSize: 10.0
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //     // Row(
                //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     //     children: <Widget>[
                //     //       IconButton(
                //     //         icon: const Icon(Icons.call),
                //     //         color: Theme.of(context).colorScheme.secondary,
                //     //         onPressed: () {
                //     //           Navigator.of(context).pushNamed('/voicecall');
                //     //         },
                //     //       ),
                //     //       IconButton(
                //     //         icon: const Icon(Icons.video_call),
                //     //         color: Theme.of(context).colorScheme.secondary,
                //     //         onPressed: () {
                //     //           Navigator.of(context).pushNamed('/voicecall');
                //     //         },
                //     //       ),
                //     //       IconButton(
                //     //         icon: const Icon(Icons.chat),
                //     //         color: Theme.of(context).colorScheme.secondary,
                //     //         onPressed: () {
                //     //           Navigator.of(context).pushNamed('/chat');
                //     //         },
                //     //       ),
                //     //       IconButton(
                //     //         icon: const Icon(Icons.person),
                //     //         // color: Colors.green,
                //     //         color: Theme.of(context).colorScheme.secondary,
                //     //         onPressed: () {
                //     //           Navigator.of(context).pushNamed('/doctorProfil');
                //     //         },
                //     //       ),
                //     //     ]
                //     // )
                //
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget ball(String image,Color color){
    return Container(
      // height: 60,
      // width: 60.0,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,
        ),

      ),

    );
  }
}
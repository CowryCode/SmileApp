import 'package:flutter/material.dart';
import 'package:SmileApp/models/mymodels/providermodels/patient.dart' as model;
class MyPatientsCardWidget extends StatefulWidget {
  final model.Patient patients;
  const MyPatientsCardWidget({Key? key, required this.patients}) : super(key: key);

  @override
  _MyPatientsCardWidgetState createState() => _MyPatientsCardWidgetState();
}

class _MyPatientsCardWidgetState extends State<MyPatientsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){
                Navigator.of(context).pushNamed('/patientencounterprofile');
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
                  padding: const EdgeInsets.only(top:20.0,bottom: 20.0,left: 12.0,right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 25.0),
                            child:ball(this.widget.patients.avatar),
                          ),
                          Container(
                              // width: 150,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${widget.patients.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Text(
                                    '${widget.patients.description}',
                                    textWidthBasis: TextWidthBasis.longestLine,

                                    style: TextStyle(

                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              )

                          ),
                        ],
                      ),
                      Container(
                          // width: 150,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Last Visit Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  color: Theme.of(context).colorScheme.secondary
                                ),
                              ),
                              SizedBox(height: 12,),
                              Text(
                                '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                                textWidthBasis: TextWidthBasis.longestLine,

                                style: TextStyle(

                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          )
                        // child: IconButton(
                        //   padding: EdgeInsets.all(0),
                        //   onPressed: (){
                        //     Navigator.of(context).pushNamed('/chat');
                        //   },
                        //   icon: Icon(Icons.chat_bubble_outline),
                        //   iconSize: 20,
                        //   color: Theme.of(context).accentColor,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        )

    );
  }
  Widget ball(String image){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(100.0),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,)

      ),
    );
  }
}
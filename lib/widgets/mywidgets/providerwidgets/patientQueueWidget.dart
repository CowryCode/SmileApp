import 'package:flutter/material.dart';
import 'package:SmileApp/models/mymodels/providermodels/patient.dart' as model;
class PatientQueueCardWidget extends StatefulWidget {
  final model.Patient patients;
  const PatientQueueCardWidget({Key key, this.patients}) : super(key: key);

  @override
  _PatientQueueCardWidgetState createState() => _PatientQueueCardWidgetState();
}

class _PatientQueueCardWidgetState extends State<PatientQueueCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150.0,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.all(6.0),
      child:FlatButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: (){
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ball(widget.patients.avatar,Colors.transparent),
                    ball(widget.patients.avatar, medStatusColor(isOnmedication: widget.patients.isOnmedication)),
                    Text(
                      // '${widget.patients.state}',
                      onMedication(isOnmedication: widget.patients.isOnmedication),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        color: this.widget.patients.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            '${widget.patients.name}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 160.0,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:Text(
                            '${widget.patients.description}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color:Colors.grey,
                                fontSize: 10.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.call),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/voicecall');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.video_call),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/voicecall');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/chat');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.person),
                            // color: Colors.green,
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/patientencounterprofile');
                            },
                          ),
                        ]
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget ball(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,
        ),

      ),

    );
  }

  String onMedication({ @required bool isOnmedication}){
    if(isOnmedication){
      return "On Medication";
    }else{
      return "Not On Medication";
    }
  }

  Color medStatusColor({ @required bool isOnmedication}){
    if(isOnmedication){
      return Colors.red;
    }else{
      return Theme.of(context).colorScheme.secondary;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:medico/models/mymodels/providermodels/patient.dart' as model;
import 'package:medico/models/user.dart';
import 'package:medico/widgets/myDoctorsWidget.dart';
import 'package:medico/widgets/mywidgets/providerwidgets/mypatientwidget.dart';
class MyPatientsList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _MyPatientsListState createState() => _MyPatientsListState();
}

class _MyPatientsListState extends State<MyPatientsList> {
  model.PatientsList patientsList;
  @override
  void initState() {
    this.patientsList = new model.PatientsList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          // onPressed: (){
          //   Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name,widget.currentUser.phoneNumber]);
          // },
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Patients',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                separatorBuilder: (context,index){
                  return SizedBox(height: 4.0);
                },
                itemBuilder: (context,index){
                  return MyPatientsCardWidget(
                    patients: patientsList.patients.elementAt(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

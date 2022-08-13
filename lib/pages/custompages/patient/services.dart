import 'package:flutter/material.dart';
import 'package:SmileApp/models/user.dart';
import 'package:SmileApp/models/offer.dart' as model;
import 'package:SmileApp/models/mymodels/patientmodels/service.dart' as model;
import 'package:SmileApp/widgets/mywidgets/patientwidgets/servicesWidget.dart';
import 'package:SmileApp/widgets/offersWidget.dart';
class ServicesList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {

  model.ServicesList servicesList;
  @override
  void initState() {
    this.servicesList = new model.ServicesList();
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
          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )


          ,
          onPressed: (){
            // Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name,widget.currentUser.phoneNumber]);
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Services',
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
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: servicesList.service.length,
                separatorBuilder: (context,index){
                  return SizedBox(height: 4.0);
                },
                itemBuilder: (context,index){
                  return ServicesCardWidget(
                    service: servicesList.service.elementAt(index),
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

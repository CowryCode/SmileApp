
import 'dart:async';
import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/models/countrymodel.dart';
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SmileApp/models/user.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class SmilegramLogin extends StatefulWidget {

  SmilegramLogin();

  @override
  _SmilegramLoginState createState() => _SmilegramLoginState();
}

class _SmilegramLoginState extends State<SmilegramLogin> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final  _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  bool justloggedin = false;
  bool loginstatus = false;
  late Future<UserProfile> userprofile;

  User currentUser = new User.init().getCurrentUser();

  List<Model>? data;

  @override
  void initState() {
    super.initState();

    GlobeModel  gm = GlobeModel();
    data = gm.getProcessedcountries(userCountriesIndexString: "0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17")!;
    // INITIALIZE WHEN DATA IS NULL
    if(data == null){
      data = <Model>[
        Model(state: 'Algeria', storage: "Low"), // Used to initialize Map
      ];
    }
    print("Raw Data Source : $data");
    //Map Data
    MapShapeSource sublayerDataSource = MapShapeSource.asset(
      "assets/world_map.json",
      shapeDataField: "admin",
      dataCount: data!.length,
      primaryValueMapper: (int index) {
        return data![index].state;
      },
      shapeColorValueMapper: (int index) {
        return data![index].storage;
      },
      shapeColorMappers: [
        MapColorMapper(value: "Low", color: Colors.red),
        MapColorMapper(value: "High", color: Colors.green)
      ],
    );

    WidgetsBinding.instance.addPostFrameCallback((_){
      SGMessage sgMSG = StoreProvider.of<MyAppState>(context).state.sg_message;
      sgMSG.setTokenindex(indexcount: 0);
      sgMSG.setCountriesID(countriesID: "0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17");
      sgMSG.setSubLayerDataSource(subelayerdata: sublayerDataSource);
      print("DATA SET : ${sgMSG.sublayerDataSource}");
      StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMSG));
      Navigator.of(context).pushNamed('/home_with_alert');
    });

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
         child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 400.0,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                image: DecorationImage(
                  image:AssetImage('assets/logo1.jpeg'),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ),
              ),
            ),
            _loginform(),
            Container(
              margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
              child: Center(
                child: Text(
                  "By continuing, you agree to Terms & Conditions",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                  ),

                ),
              ),
            ),

          ],
        ),
        ),
    );
  }

  Widget _loginform(){
    return Column(
      children: <Widget> [
        Container(
          margin: EdgeInsets.only(top: 12.0),
          child: Text(
            "Enter the email address or phone number \n used in the consent form",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
            ),
          ),
        ),

        FormBuilder(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                FormBuilderTextField(
                  key: _emailFieldKey,
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                ElevatedButton(
                  child: const Text('Submit',
                  ),
                  onPressed: () async {
                   String phonenumber =  _formKey.currentState?.fields["email"]!.value;
                   setState(() {
                     justloggedin = true;
                   });
                   userprofile = ApiAccess().loginWithPhoneNumber(phonenumber: phonenumber);
                   userprofile.then((value) => {
                     if(value != null){
                       Localstorage().saveBoolean(key_login_status, true),
                       print("THE EMAIL : ${phonenumber}"),
                       Navigator.of(context).pushNamed('/home_with_alert')
                     }
                   });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
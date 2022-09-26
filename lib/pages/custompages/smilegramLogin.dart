
import 'dart:async';
import 'package:SmileApp/apis/diskstorage.dart';
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SmileApp/models/user.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:glassmorphism/glassmorphism.dart';

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


  @override
  void initState() {
    super.initState();
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
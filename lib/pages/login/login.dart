import 'dart:ffi';

import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String countryCode = "";
  String phoneNumber = "";
  TextEditingController textEditingController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Color(0xeeffffff),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: Icon(Icons.close,color: Colors.black),
        //     onPressed: (){
        //       Navigator.of(context).pushNamed('/signup');
        //     },
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children:[
              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.only(top: 30.0),
              //   child: Image(
              //     image:AssetImage("images/verification.png"),
              //   ),
              // ),
              Container(
                // height: 400.0,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                  image: DecorationImage(
                    image:AssetImage('assets/logo1.png'),
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
              Container(
               // margin: EdgeInsets.only(top: 12.0),
                margin: EdgeInsets.all(12.0),
                child: Text(
                  "Enter the email address you used while signing up for the study or the ID shared with you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                  ),
                ),
              ),
              Container(
               // height: 180.0,
                height: 220.0,
                margin: EdgeInsets.only(top:12.0,right:12.0,left:12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children:[
                    // Form(
                    //   key: _formKey,
                    //   child: Row(
                    //     children: <Widget>[
                    //       Expanded(
                    //         child: Container(
                    //           height: 40.0,
                    //           margin: EdgeInsets.only(top: 20.0 ,left: 12.0,right: 12.0),
                    //           decoration: BoxDecoration(
                    //             border: Border.all(width: 1.0,color: Color(0xdddddddd)),
                    //             borderRadius: BorderRadius.circular(12.0),
                    //           ),
                    //           child:Center(
                    //             child: FormBuilderTextField(
                    //               name: 'useid',
                    //               controller: textEditingController,
                    //               validator: FormBuilderValidators.compose([
                    //                 FormBuilderValidators.required(
                    //                     errorText: "Please enter a valid email."),
                    //                 FormBuilderValidators.email(),
                    //                 FormBuilderValidators.min(0),
                    //               ]),
                    //               autovalidateMode: AutovalidateMode.onUserInteraction,
                    //               keyboardType: TextInputType.emailAddress,
                    //               decoration: InputDecoration(
                    //                 contentPadding: EdgeInsets.only(top: 6,left:12,right: 12),
                    //                 border: InputBorder.none,
                    //                 suffixIcon:Icon(Icons.verified_user),
                    //                 // prefixText: "",
                    //                 prefixStyle: TextStyle(
                    //                     color: Colors.black
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Form(
                      key: _formKey,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: FormBuilderTextField(
                                name: 'useid',
                                controller: textEditingController,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "Please enter a valid email."),
                                  //FormBuilderValidators.email(),
                                  FormBuilderValidators.min(0),
                                ]),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 16,left:12,right: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                                  ),
                                 // border: InputBorder.none,
                                  suffixIcon:Icon(Icons.verified_user),
                                  // prefixText: "",
                                  prefixStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),
                          ),

                          // Expanded(
                          //   child: Container(
                          //     height: 40.0,
                          //     margin: EdgeInsets.only(top: 20.0 ,left: 12.0,right: 12.0),
                          //     decoration: BoxDecoration(
                          //       border: Border.all(width: 1.0,color: Color(0xdddddddd)),
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     child:Center(
                          //       child: FormBuilderTextField(
                          //         name: 'useid',
                          //         controller: textEditingController,
                          //         validator: FormBuilderValidators.compose([
                          //           FormBuilderValidators.required(
                          //               errorText: "Please enter a valid email."),
                          //           FormBuilderValidators.email(),
                          //           FormBuilderValidators.min(0),
                          //         ]),
                          //         autovalidateMode: AutovalidateMode.onUserInteraction,
                          //         keyboardType: TextInputType.emailAddress,
                          //         decoration: InputDecoration(
                          //           contentPadding: EdgeInsets.only(top: 6,left:12,right: 12),
                          //           border: InputBorder.none,
                          //           suffixIcon:Icon(Icons.verified_user),
                          //           // prefixText: "",
                          //           prefixStyle: TextStyle(
                          //               color: Colors.black
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:50.0,bottom: 20.0,right:30.0,left: 30.0 ),
                      height: 40,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: (){
                          String userid = textEditingController.value.text.trim();
                          //ApiAccess().login(logincode: textEditingController.value.text.trim());
                          //Navigator.of(context).pushNamed('/welcome');
                          GiftVariableObject variables = GiftVariableObject(readmessage: false, msg: userid);
                          Navigator.of(context).pushNamed('/processlogin', arguments: variables);
                      },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          child:  Center(
                            child:Text(
                              'Submit',
                              style:  TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
    
}
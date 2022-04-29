import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medico/models/conversation.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key key}) : super(key: key);
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final _formKey = GlobalKey<FormBuilderState>();
  String countryCode = "";
  String phoneNumber = "";
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Complete Profile",
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body:Center(
        child: Container(
              // START OF MY EDIT
              padding: const EdgeInsets.all(0.0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.center,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getTextField(
                        filedName: "username",
                        fieldLabel: "Enter your username",
                        prefixIcon: Icon(Icons.verified_user_outlined),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(15),
                      ]),
                    ),
                    SizedBox(height: 10,),
                    getTextField(
                        filedName: "name",
                        fieldLabel: "Enter your Fullname",
                        prefixIcon: Icon(Icons.person),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(15),
                      ]),
                    ),
                    SizedBox(height: 10,),
                    getTextField(
                        filedName: "email",
                        fieldLabel: "Enter your Email address",
                        prefixIcon: Icon(Icons.email_outlined),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(25),
                          FormBuilderValidators.email(errorText: "This field should contain valid email")
                      ]),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.saveAndValidate()) {
                          print(_formKey.currentState.value['email']);
                          print(_formKey.currentState.value['password']);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
          // END OF MY EDITH
      ),
    )
    );
  }

  FormBuilderTextField getTextField({ @required String filedName, @required String fieldLabel, @required Icon prefixIcon, FormFieldValidator<String> fieldValidator}){
    return FormBuilderTextField(
      name: filedName,
      obscureText: false, // For Passwords
      autocorrect: true,
      style: Theme.of(context).textTheme.subtitle2,
      decoration: InputDecoration(
        labelText: fieldLabel,
        hintText: fieldLabel,
        hintStyle: Theme.of(context).textTheme.subtitle1,
        labelStyle: Theme.of(context).textTheme.subtitle2,
        filled: true,
         prefixIcon: prefixIcon,
        // suffixIcon: Icon(Icons.nat),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.5),
        ),
      ),
      validator: fieldValidator,
      // validator: FormBuilderValidators.compose([
      //   FormBuilderValidators.required(),
      //   FormBuilderValidators.minLength(6),
      // ]),

      onChanged: (text) {
        print("The text is : ${text}");
      },
    );
  }

}

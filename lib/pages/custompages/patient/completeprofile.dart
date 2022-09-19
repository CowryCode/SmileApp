import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CompleteProfile extends StatefulWidget {
  // CompleteProfile({Key key}) : super(key: key);
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final _formKey = GlobalKey<FormBuilderState>();
  String countryCode = "";
  String phoneNumber = "";
  final myController = TextEditingController();

  get genderOptions => ["Option 1", "Option 2", "Option 3"];

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
            child: SingleChildScrollView(
              // START OF MY EDIT
              // padding: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.only(top: 12.0, bottom:12.0, left: 18.0,right: 18.0),
              // width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 3,
              // alignment: Alignment.center,
              child: FormBuilder(
                key: _formKey,
                  child:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getTextField(context,
                        filedName: "username",
                        fieldLabel: "Enter your username",
                        prefixIcon: Icon(Icons.verified_user_outlined),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(5),
                      ]),
                    ),
                    SizedBox(height: 10,),
                    getTextField(context,
                        filedName: "name",
                        fieldLabel: "Enter your Fullname",
                        prefixIcon: Icon(Icons.person),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(5),
                      ]),
                    ),
                    SizedBox(height: 10,),
                    getTextField(context,
                        filedName: "email",
                        fieldLabel: "Enter your Email address",
                        prefixIcon: Icon(Icons.email_outlined),
                        fieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(5),
                          FormBuilderValidators.email(errorText: "This field should contain valid email")
                      ]),
                    ),
                    SizedBox(height: 10,),
                    FormBuilderSlider(
                      name: 'slider',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.min(6),
                      ]),
                      onChanged: (text) {
                          print("The text is : ${text}");
                      },
                      min: 2.0,
                      max: 20.0,
                      initialValue: 7.0,
                      divisions: 20,
                      activeColor: Colors.red,
                      inactiveColor: Colors.pink[100],
                      decoration: InputDecoration(
                        labelText: 'Show doctors within (km)',
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    FormBuilderFilterChip(
                      name: 'filter_chip',
                      decoration: InputDecoration(
                        labelText: 'Select Service of Interest',
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                      ), options: [],
                     // options: [
                      //   FormBuilderFieldOption(
                      //       value: 'Dibia Igbo', child: Text('Dibia Igbo')),
                      //   FormBuilderFieldOption(
                      //       value: 'Yoruba Dibia', child: Text('Yoruba Dibia')),
                      //   FormBuilderFieldOption(
                      //       value: 'Express Doc. Ateention', child: Text('Express Doc. Ateention')),
                      //   FormBuilderFieldOption(
                      //       value: 'PHS', child: Text('PHS')),
                      //   FormBuilderFieldOption(
                      //       value: 'vitals Monitoring', child: Text('vitals Monitoring')),
                      // ],
                    ),
                    FormBuilderChoiceChip(
                      name: 'choice_chip',
                      decoration: InputDecoration(
                        labelText: 'Select alert option',
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                      ), options: [],
                      // options: [
                      //   FormBuilderFieldOption(
                      //       value: 'Test', child: Text('Service Notification')),
                      //   FormBuilderFieldOption(
                      //       value: 'Test 1', child: Text('Doctor Availability')),
                      //   FormBuilderFieldOption(
                      //       value: 'Test 2', child: Text('Appointments')),
                      //   FormBuilderFieldOption(
                      //       value: 'Test 3', child: Text('Queue Progress')),
                      //   FormBuilderFieldOption(
                      //       value: 'Test 4', child: Text('No Notification')),
                      // ],
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      // onChanged: _onChanged,
                      inputType: InputType.time,
                      decoration: InputDecoration(
                        labelText: 'Appointment Time',
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                      ),
                      initialTime: TimeOfDay(hour: 8, minute: 0),
                      initialValue: DateTime.now(),
                      enabled: true,
                    ),
                    FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      format: DateFormat('yyyy-MM-dd'),
                      initialValue: DateTimeRange(
                        start: DateTime(2021),
                        end: DateTime.now()
                      ),
                      onChanged: (text) {
                           print("The text is : ${text}");
                         },
                        decoration: InputDecoration(
                        labelText: 'Date Range',
                        helperText: 'Helper text',
                          helperStyle: Theme.of(context).textTheme.subtitle2,
                        hintText: 'Hint text',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        ),
                    //     FormBuilderCheckbox(
                    //     name: 'accept_terms',
                    //     initialValue: false,
                    //     onChanged: _onChanged,
                    //     title: RichText(
                    //     text: TextSpan(
                    //     children: [
                    //     TextSpan(
                    //     text: 'I have read and agree to the ',
                    //     style: TextStyle(color: Colors.black),
                    //     ),
                    //     TextSpan(
                    //     text: 'Terms and Conditions',
                    //     style: TextStyle(color: Colors.blue),
                    //     ),
                    //    ],
                    //   ),
                    //  ),
                    //   validator: FormBuilderValidators.equal(
                    //     context,
                    //     errorText:
                    //     'You must accept terms and conditions to continue',
                    //   ),
                    // ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            color: Theme.of(context).accentColor,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                print(_formKey.currentState!.value);
                              } else {
                                print("validation failed");
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Text(
                              "Reset",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _formKey.currentState!.reset();
                            },
                          ),
                        ),
                      ],
                    )
                   ],
                  ),
                ),
                ),
                ),
              );
          // END OF MY EDITH
  }

  FormBuilderTextField getTextField(BuildContext context, { required String filedName, required String fieldLabel, required Icon prefixIcon, required FormFieldValidator<String> fieldValidator}){
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
      // validator: fieldValidator,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(6),
      ]),

      onChanged: (text) {
        print("The text is : ${text}");
      },
    );
  }


  void _onChanged(bool value) {
      print("_onchnage called");
  }
}

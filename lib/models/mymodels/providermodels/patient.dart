
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Patient{
  String id = UniqueKey().toString();
  String name;
  String description;
  String state;
  Color color;
  String avatar;
  bool isOnmedication;

  Patient.init();
  Patient(this.name,this.description,this.avatar,this.state,this.color, this.isOnmedication);
  Patient getCurrentDoctor() {
    return Patient("John Doe", "Last reported illness",
        "images/asset-1.png","On Medication", Colors.red, true);
  }
}
class PatientsList{
  List<Patient> _patientList;
  PatientsList(){
    this._patientList =[
      new Patient("John Doe", "Last reported illness",
          "images/asset-1.png","On Medication", Colors.red, true),
      new Patient("Dr.Steve Robert", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-2.png","Available", Colors.green, true),
      new Patient("Dr.Steve Robert", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-3.png","Available", Colors.green, false),
      new Patient("Dr.Alina james", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-4.png","Not Available", Colors.red, true),
      new Patient("Dr.Frank karima", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-5.png","Available", Colors.green, false),
      new Patient("Dr.Nemeli Aaraf", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-6.png","Available", Colors.green, false),
    ];
  }
  List<Patient> get patients => _patientList;
}
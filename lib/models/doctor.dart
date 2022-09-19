
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Doctor{
  String? id = UniqueKey().toString();
  String? name;
  String? description;
  String? state;
  Color? color;
  String? avatar;

  Doctor.init();
  Doctor({ required this.name,required this.description, required this.avatar, required this.state, this.color});
  Doctor getCurrentDoctor() {
    return Doctor(name: "Dr.Alina james", description: "B.Sc DDVL Demilitologist",
        avatar: "images/asset-1.png", state: "Not Available", color: Colors.red);
  }
}
class DoctorsList{
  List<Doctor>? _doctorsList;
  DoctorsList(){
    this._doctorsList =[
      new Doctor(name: "Dr.Alina james", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-1.png",state: "Not Available", color: Colors.red),
      new Doctor(name: "Dr.Steve Robert", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-2.png",state: "Available", color: Colors.green),
      new Doctor(name: "Dr.Steve Robert", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-3.png",state: "Available",color:  Colors.green),
      new Doctor(name: "Dr.Alina james", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-4.png",state: "Not Available",color:  Colors.red),
      new Doctor(name: "Dr.Frank karima", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-5.png",state: "Available",color:  Colors.green),
      new Doctor(name: "Dr.Nemeli Aaraf", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-6.png",state: "Available", color: Colors.green),
    ];
  }
  List<Doctor>? get doctors => _doctorsList;
}
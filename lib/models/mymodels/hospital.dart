
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Hospital{
  String id = UniqueKey().toString();
  String name;
  String description;
  String state;
  Color color;
  String avatar;

  Hospital.init();
  Hospital(this.name,this.description,this.avatar,this.state,this.color);
  Hospital getFeaturedHospital() {
    return Hospital("Toronto General - University Health Network", "Great hospital to have your child",
        "images/asset-1.png","Toronto - Canada", Colors.green);
  }
}
class HospitalList{
  List<Hospital> _hospitalsList;
  HospitalList(){
    this._hospitalsList =[
      new Hospital("Sunnybrook Health Sciences Centre", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-1.png","Toronto - Canada", Colors.green),
      new Hospital("Mount Sinai Hospital", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-2.png","Toronto - Canada", Colors.green),
      new Hospital("North York General Hospital", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-3.png","Toronto - Canada", Colors.green),
      new Hospital("Jewish General Hospital", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-4.png","Montreal - Canada", Colors.red),
      new Hospital("Rockyview General Hospital", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-5.png","Calgary - Canada", Colors.green),
      new Hospital("Vancouver General Hospital", "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-6.png","Vancouver - Canada", Colors.green),
    ];
  }
  List<Hospital> get hospitals => _hospitalsList;
}
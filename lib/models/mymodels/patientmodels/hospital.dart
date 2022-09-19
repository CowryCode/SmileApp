
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Hospital{
  String? id = UniqueKey().toString();
  String? name;
  String? description;
  String? state;
  Color? color;
  String? avatar;

  Hospital.init();
  Hospital({this.name,this.description,this.avatar,this.state,this.color});
  Hospital getFeaturedHospital() {
    return Hospital(name:"Toronto General - University Health Network", description: "Great hospital to have your child",
        avatar: "images/asset-1.png", state: "Toronto - Canada", color: Colors.green);
  }
}
class HospitalList{
  List<Hospital>? _hospitalsList;
  HospitalList(){
    this._hospitalsList =[
      new Hospital(name: "Sunnybrook Health Sciences Centre", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-1a.jpeg", state: "Toronto - Canada", color: Colors.green),
      new Hospital( name: "Mount Sinai Hospital", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-2a.jpeg",state: "Toronto - Canada", color:  Colors.green),
      new Hospital(name: "North York General Hospital", description: "B.Sc DDVL Demilitologist 26 years of experience",
          avatar: "images/asset-3a.jpeg", state: "Toronto - Canada", color:  Colors.green),
    ];
  }
  List<Hospital>? get hospitals => _hospitalsList;
}
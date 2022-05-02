import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Service {
  String id = UniqueKey().toString();
  String titel;
  String description;
  String code;
  bool isSubscribed;
  Service.init();
  Service(this.titel,this.description,this.code, this.isSubscribed);
}

class ServicesList{
  List<Service> _offersList;
  ServicesList(){
    this._offersList =[
      new Service('Limited Offer Only @99', 'Express doctor consultation service \n get a doctor anytime irrespective of queue', "PREMIUM", true),
      new Service('Chat whith General Physician @99', 'Cold, fever, cough or flu? Chat whith \na doctor now', "PREMIUM", false),
      new Service('Chat whith General Physician @99', 'Cold, fever, cough or flu? Chat whith \na doctor now', "REGULAR", true)

    ];
  }
  List<Service> get service => _offersList;
}
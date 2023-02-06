import 'package:SmileApp/apis/Utilities.dart';

class MoodModel {
  String? startDate;
  String? startTime;
  int? startMood;
  String? endDate;
  String? endTime;
  int? endMood;
  double? smileduration;
  int? countrycount;
  double? timeSpentSec;

  MoodModel(
      {this.startDate,
        this.startTime,
        this.startMood,
        this.endDate,
        this.endTime,
        this.endMood,
        this.smileduration,
        this.countrycount,
        this.timeSpentSec
      });

  MoodModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    startTime = json['startTime'];
    startMood = json['startMood'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    endMood = json['endMood'];
    smileduration = json['smileduration'];
    countrycount = json['countrycount'];
    timeSpentSec = json['timeSpentSec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['startTime'] = this.startTime;
    data['startMood'] = this.startMood;
    data['endDate'] = this.endDate;
    data['endTime'] = this.endTime;
    data['endMood'] = this.endMood;
    data['smileduration'] = this.smileduration;
    data['countrycount'] = this.countrycount;
    data['timeSpentSec'] = this.timeSpentSec;
    return data;
  }

  void initializeMood({required int rating}){
    Utilities utilities = Utilities();
    this.startDate = utilities.getDateFromDevice();
    this.startTime = utilities.getTimeFromDevice();
    this.startMood = rating;
  }

  void captureMood({required int rating, required double smileduration, required int countrycount, required double timeSpent}){
    Utilities utilities = Utilities();
    this.endDate = utilities.getDateFromDevice();
    this.endTime = utilities.getTimeFromDevice();
    this.endMood = rating;
    this.smileduration = smileduration;
    this.countrycount = countrycount;
    this.timeSpentSec = timeSpent;
  }
  void resetMood({required MoodModel savedMood}){
      this.startDate = savedMood.startDate;
      this.startTime = savedMood.startTime;
      this.startMood = savedMood.startMood;
      this.endDate = null;
      this.endTime = null;
      this.endMood = null;
    }

  // void resetMood(){
  //   Utilities utilities = Utilities();
  //   DateTime date1 = DateTime.parse("$startDate 00:00:00");
  //   DateTime date2 = DateTime.parse("$endDate 00:00:00");
  //   if(date1.compareTo(date2) == 0){
  //     this.endDate = null;
  //     this.endTime = null;
  //     this.endMood = null;
  //   }else{
  //     this.startDate = utilities.getDateFromDevice();
  //     this.startTime = utilities.getTimeFromDevice();
  //     this.endDate = null;
  //     this.endTime = null;
  //     this.endMood = null;
  //   }
  // }
}

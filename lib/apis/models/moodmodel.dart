import 'package:SmileApp/apis/Utilities.dart';

class MoodModel {
  String? startDate;
  String? startTime;
  int? startMood;
  String? endDate;
  String? endTime;
  int? endMood;
  double? smileduration;

  MoodModel(
      {this.startDate,
        this.startTime,
        this.startMood,
        this.endDate,
        this.endTime,
        this.endMood,
        this.smileduration});

  MoodModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    startTime = json['startTime'];
    startMood = json['startMood'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    endMood = json['endMood'];
    smileduration = json['smileduration'];
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
    return data;
  }

  void initializeMood({required int rating}){
    Utilities utilities = Utilities();
    this.startDate = utilities.getDateFromDevice();
    this.startTime = utilities.getTimeFromDevice();
    this.startMood = rating;
  }

  void captureMood({required int rating, required int countrycount}){
    Utilities utilities = Utilities();
    this.endDate = utilities.getDateFromDevice();
    this.endTime = utilities.getTimeFromDevice();
    this.endMood = rating;
   // this.smileduration = utilities.calculateDurationInSeconds(smileStartTime, DateTime.now());
   // this.smileduration = countrycount * 5;
    // 20 COUNTS = Seconds
    this.smileduration = (countrycount/20) * 5;

    print('SMILE DURATION IN SECONDS : ${this.smileduration}');
  }

  void resetMood(){
    Utilities utilities = Utilities();
    DateTime date1 = DateTime.parse("$startDate 00:00:00");
    DateTime date2 = DateTime.parse("$endDate 00:00:00");
    if(date1.compareTo(date2) == 0){
      this.endDate = null;
      this.endTime = null;
      this.endMood = null;
    }else{
      this.startDate = utilities.getDateFromDevice();
      this.startTime = utilities.getTimeFromDevice();
      this.endDate = null;
      this.endTime = null;
      this.endMood = null;
    }
  }
}

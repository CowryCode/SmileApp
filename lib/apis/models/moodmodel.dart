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
}

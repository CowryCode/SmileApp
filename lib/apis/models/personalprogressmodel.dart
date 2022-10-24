class PersonalProgresses {
  int? id;
  int? scoredValue;
  int? targetValue;

  PersonalProgresses({this.id, this.scoredValue, this.targetValue});

  PersonalProgresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scoredValue = json['scoredValue'];
    targetValue = json['targetValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scoredValue'] = this.scoredValue;
    data['targetValue'] = this.targetValue;
    return data;
  }
}

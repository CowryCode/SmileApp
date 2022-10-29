class PersonalProgresses {
  int? id;
  int? scoredValue;
  int? targetValue;

  PersonalProgresses({this.id, this.targetValue , this.scoredValue});

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

  void initialize({required int targetValue, required int scoredValue}){
    this.targetValue = targetValue;
    this.scoredValue = scoredValue;
  }

  void setScore({required int score}){
    this.scoredValue = score;
  }
}

class GlobalProgresses {
  String? username;
  int? acumulatedValue;
  double? globalpercent;

  GlobalProgresses({this.username, this.acumulatedValue, this.globalpercent});

  GlobalProgresses.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    acumulatedValue = json['acumulatedValue'];
    globalpercent = json['globalpercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['acumulatedValue'] = this.acumulatedValue;
    data['globalpercent'] = this.globalpercent;
    return data;
  }
}
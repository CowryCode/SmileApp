class UserProfile {
  int? id;
  String? name;
  String? phonenumber;
  bool? isconsented;
  double? smilegrampoint;
  String? deviceId;

  UserProfile(
      {this.id,
        this.name,
        this.phonenumber,
        this.isconsented,
        this.smilegrampoint,
        this.deviceId});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    isconsented = json['isconsented'];
    smilegrampoint = json['smilegrampoint'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['isconsented'] = this.isconsented;
    data['smilegrampoint'] = this.smilegrampoint;
    data['deviceId'] = this.deviceId;
    return data;
  }
}

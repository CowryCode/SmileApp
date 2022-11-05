class TribeRequest {
  int? senderID;
  String? content;
  String? sourceCountry;
  bool? responded;

  TribeRequest(
      {this.senderID, this.content, this.sourceCountry, this.responded});

  TribeRequest.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    content = json['content'];
    sourceCountry = json['sourceCountry'];
    responded = json['responded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderID'] = this.senderID;
    data['content'] = this.content;
    data['sourceCountry'] = this.sourceCountry;
    data['responded'] = this.responded;
    return data;
  }

}

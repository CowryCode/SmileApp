class TribeRequest {
  int? id;
  String? senderID;
  String? receiverID;
  String? content;
  String? sourceCountry;
  bool? responded;

  TribeRequest(
      {this.senderID, this.receiverID, this.content, this.sourceCountry, this.responded});

  TribeRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderID = json['senderID'];
    receiverID = json['receiverID'];
    content = json['content'];
    sourceCountry = json['sourceCountry'];
    responded = json['responded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senderID'] = this.senderID;
    data['receiverID'] = this.receiverID;
    data['content'] = this.content;
    data['sourceCountry'] = this.sourceCountry;
    data['responded'] = this.responded;
    return data;
  }

}

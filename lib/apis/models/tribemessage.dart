class TribeMessage {
  int? id;
  int? receiverID;
  String? content;
  String? sourceCountry;
  bool? isread;

  TribeMessage(
      {this.receiverID, this.content, this.sourceCountry, this.isread});

  TribeMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    receiverID = json['receiverID'];
    content = json['content'];
    sourceCountry = json['sourceCountry'];
    isread = json['isread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['receiverID'] = this.receiverID;
    data['content'] = this.content;
    data['sourceCountry'] = this.sourceCountry;
    data['isread'] = this.isread;
    return data;
  }

}

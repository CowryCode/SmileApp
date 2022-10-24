class TribeMessage {
  int? id;
  String? content;
  int? numberoflikes;
  bool? isread;

  TribeMessage({this.id, this.content, this.numberoflikes, this.isread});

  TribeMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    numberoflikes = json['numberoflikes'];
    isread = json['isread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['numberoflikes'] = this.numberoflikes;
    data['isread'] = this.isread;
    return data;
  }
}

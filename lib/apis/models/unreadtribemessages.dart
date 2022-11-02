import 'package:SmileApp/apis/models/tribemessage.dart';

class UnreadTribeMessage {
  List<TribeMessage>? messages;

  UnreadTribeMessage({this.messages});

  UnreadTribeMessage.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <TribeMessage>[];
      json['messages'].forEach((v) {
        messages!.add(new TribeMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



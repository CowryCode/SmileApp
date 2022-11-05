import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/apis/models/triberequest.dart';

class UnrepliedTribeCalls {
  List<TribeRequest>? msgcalls;

  UnrepliedTribeCalls({this.msgcalls});

  UnrepliedTribeCalls.fromJson(Map<String, dynamic> json) {
    if (json['msgcalls'] != null) {
      msgcalls = <TribeRequest>[];
      json['msgcalls'].forEach((v) {
        msgcalls!.add(new TribeRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.msgcalls != null) {
      data['msgcalls'] = this.msgcalls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



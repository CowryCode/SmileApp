import 'package:SmileApp/apis/models/globalprogressmodel.dart';
import 'package:SmileApp/apis/models/personalprogressmodel.dart';

class LeaderBoard{
  List<PersonalProgresses>? personalProgresses;
  List<GlobalProgresses>? globalProgresses;

  LeaderBoard({this.personalProgresses, this.globalProgresses});

  LeaderBoard.fromJson(Map<String, dynamic> json) {
    if (json['personalProgresses'] != null) {
      personalProgresses = <PersonalProgresses>[];
      json['personalProgresses'].forEach((v) {
        personalProgresses!.add(new PersonalProgresses.fromJson(v));
      });
    }
    if (json['globalProgresses'] != null) {
      globalProgresses = <GlobalProgresses>[];
      json['globalProgresses'].forEach((v) {
        globalProgresses!.add(new GlobalProgresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalProgresses != null) {
      data['personalProgresses'] =
          this.personalProgresses!.map((v) => v.toJson()).toList();
    }
    if (this.globalProgresses != null) {
      data['globalProgresses'] =
          this.globalProgresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class QuesionnaireBMIScale {
  int? id;
  int? lively;
  int? happy;
  int? sad;
  int? tired;
  int? caring;
  int? content;
  int? gloomy;
  int? jittery;
  int? drowsy;
  int? grouchy;
  int? peppy;
  int? nervous;
  int? calm;
  int? loving;
  int? fedup;
  int? active;

  QuesionnaireBMIScale(
      {this.id,
      this.lively,
      this.happy,
      this.sad,
      this.tired,
      this.caring,
      this.content,
      this.gloomy,
      this.jittery,
      this.drowsy,
      this.grouchy,
      this.peppy,
      this.nervous,
      this.calm,
      this.loving,
      this.fedup,
      this.active});

  QuesionnaireBMIScale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lively = json['lively'];
    happy = json['happy'];
    sad = json['sad'];
    tired = json['tired'];
    caring = json['caring'];
    content = json['content'];
    gloomy = json['gloomy'];
    jittery = json['jittery'];
    drowsy = json['drowsy'];
    grouchy = json['grouchy'];
    peppy = json['peppy'];
    nervous = json['nervous'];
    calm = json['calm'];
    loving = json['loving'];
    fedup = json['fedup'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lively'] = this.lively;
    data['happy'] = this.happy;
    data['sad'] = this.sad;
    data['tired'] = this.tired;
    data['caring'] = this.caring;
    data['content'] = this.content;
    data['gloomy'] = this.gloomy;
    data['jittery'] = this.jittery;
    data['drowsy'] = this.drowsy;
    data['grouchy'] = this.grouchy;
    data['peppy'] = this.peppy;
    data['nervous'] = this.nervous;
    data['calm'] = this.calm;
    data['loving'] = this.loving;
    data['fedup'] = this.fedup;
    data['active'] = this.active;
    return data;
  }

  void updatedQuestionnare({required int position, required int userchoice}){
    switch(position){
      case 0:
        this.lively = userchoice;
        break;
      case 1:
        this.happy = userchoice;
        break;
      case 2:
        this.sad = userchoice;
        break;
      case 3:
        this.tired = userchoice;
        break;
      case 4:
        this.caring = userchoice;
        break;
      case 5:
        this.content = userchoice;
        break;
      case 6:
        this.gloomy = userchoice;
        break;
      case 7:
        this.jittery = userchoice;
        break;
      case 8:
        this.drowsy = userchoice;
        break;
      case 9:
        this.grouchy = userchoice;
        break;
      case 10:
        this.peppy = userchoice;
        break;
      case 11:
        this.nervous = userchoice;
        break;
      case 12:
        this.calm = userchoice;
        break;
      case 13:
        this.loving = userchoice;
        break;
      case 14:
        this.fedup = userchoice;
        break;
      case 15:
        this.active = userchoice;
    }
  }
}

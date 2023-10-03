class ChatbotPODO {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  ChatbotPODO(
      {this.id,
        this.object,
        this.created,
        this.model,
        this.choices,
        this.usage});

  ChatbotPODO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    return data;
  }
}

class Choices {
  int? index;
  Message? message;
  String? finishReason;

  Choices({this.index, this.message, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['finish_reason'] = this.finishReason;
    return data;
  }
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['content'] = this.content;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt_tokens'] = this.promptTokens;
    data['completion_tokens'] = this.completionTokens;
    data['total_tokens'] = this.totalTokens;
    return data;
  }
}


// class chatbotPODO {
//   String? id;
//   String? object;
//   int? created;
//   String? model;
//   List<Choices>? choices;
//
//   chatbotPODO({this.id, this.object, this.created, this.model, this.choices});
//
//   chatbotPODO.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     object = json['object'];
//     created = json['created'];
//     model = json['model'];
//     if (json['choices'] != null) {
//       choices = <Choices>[];
//       json['choices'].forEach((v) {
//         choices!.add(new Choices.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['object'] = this.object;
//     data['created'] = this.created;
//     data['model'] = this.model;
//     if (this.choices != null) {
//       data['choices'] = this.choices!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Choices {
//   String? text;
//   int? index;
//   String? logprobs;
//   String? finishReason;
//
//   Choices({this.text, this.index, this.logprobs, this.finishReason});
//
//   Choices.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     index = json['index'];
//     logprobs = json['logprobs'];
//     finishReason = json['finish_reason'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['text'] = this.text;
//     data['index'] = this.index;
//     data['logprobs'] = this.logprobs;
//     data['finish_reason'] = this.finishReason;
//     return data;
//   }
// }
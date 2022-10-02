class SGmessageModel{
  String msg ;
  int index;
  SGmessageModel({required this.msg, required this.index});

  void updateSGmessage({required String message, required int index}){
    this.msg = message;
    this.index = index;
  }


}
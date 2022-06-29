// SG stands for Smile Gram
class SGMessage{
  String content;
  bool updated;
  // Management Variables
  int tokenIndex ;

  SGMessage({this.content, this.updated, this.tokenIndex = 0});
}
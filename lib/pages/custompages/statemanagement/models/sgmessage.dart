// SG stands for Smile Gram
class SGMessage{
  final String content;
  final bool updated;
  // Management Variables
  final int tokenIndex ;
  bool iscompleted;

  SGMessage({this.content, this.updated, this.tokenIndex = 0, this.iscompleted = false});
}
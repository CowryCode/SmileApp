// SG stands for Smile Gram
class SGMessage{
  final String content;
  final bool updated;
  final int tokenIndex ;
  bool iscompleted;
  bool showStartCountDown;

  SGMessage({this.content,
    this.updated,
    this.tokenIndex = 0,
    this.iscompleted = false,
    this.showStartCountDown = true,
  });
}
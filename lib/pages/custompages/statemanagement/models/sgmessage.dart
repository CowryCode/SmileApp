// SG stands for Smile Gram
class SGMessage{
  final String content;
  final bool updated;
  final int tokenIndex ;
  bool iscompleted;
  bool showStartCountDown;
  double smileProbability;

  SGMessage({required this.content,
    required this.updated,
    this.tokenIndex = 0,
    this.iscompleted = false,
    this.showStartCountDown = true,
    this.smileProbability = 0,
  });
}
import 'dart:math';

import 'package:flutter/material.dart';

class LuckPotGift extends StatefulWidget {
  const LuckPotGift({Key? key}) : super(key: key);

  @override
  _LuckPotGiftState createState() => _LuckPotGiftState();
}

class _LuckPotGiftState extends State<LuckPotGift> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: GiftPainter(),
      ),
    );
  }
}

class GiftPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var _fillBrush = Paint()
    ..color = Colors.amber;

    var _outlineBrush = Paint()
    ..color = Colors.blueAccent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 16;


    canvas.drawCircle(center, radius - 40, _fillBrush);
    canvas.drawCircle(center, radius - 40, _outlineBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

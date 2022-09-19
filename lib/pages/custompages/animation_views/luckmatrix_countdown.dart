import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LuckMetrixCountDown extends StatefulWidget {
  const LuckMetrixCountDown({Key? key}) : super(key: key);

  @override
  LuckMetrixCountDownState createState() => LuckMetrixCountDownState();
}

class LuckMetrixCountDownState extends State<LuckMetrixCountDown> with TickerProviderStateMixin{

  // AnimationController controller;
  late AnimationController controller;
  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  bool activateCountdown = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.4,
        child: animatedTimer(),
    );
  }

  Widget animatedTimer(){
    ThemeData themeData = Theme.of(context);
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child){
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.amber,
                  height:
                  controller.value * MediaQuery.of(context).size.height,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                    painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: themeData.indicatorColor,
                                    )),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Count Down Timer",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          // color: Colors.white
                                          color: themeData.colorScheme.secondary
                                      )
                                      ,
                                    ),
                                    Text(
                                      timerString,
                                      style: TextStyle(
                                        //  fontSize: 112.0,
                                          fontSize: 40.0,
                                          // color: Colors.white
                                          color: themeData.colorScheme.secondary
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ChoiceChip(
                      selectedColor: Theme.of(context).primaryColor,
                      avatar: Image.asset("images/custom/giftopen1.png"),
                      elevation: 6.0,
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      label: Text('open', style: TextStyle(color: Colors.red),),
                      selected: activateCountdown,
                      onSelected: (bool selected) {
                        if (controller.isAnimating)
                          controller.stop();
                        else {
                          controller.reverse(
                              from: controller.value == 0.0
                                  ? 1.0
                                  : controller.value);
                        }
                      },
                    ),
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return FloatingActionButton.extended(
                              onPressed: () {
                                if (controller.isAnimating)
                                  controller.stop();
                                else {
                                  controller.reverse(
                                      from: controller.value == 0.0
                                          ? 1.0
                                          : controller.value);
                                }
                              },
                              icon: Icon(controller.isAnimating
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              label: Text(
                                  controller.isAnimating ? "Pause" : "Play"));
                        }),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }



  void _randomize(){
    int _start = Duration(seconds: 5).inMilliseconds;
    Random random = new Random();
    const oneDecimal = const Duration(seconds: 1);
    Timer _timer = new Timer.periodic(
        oneDecimal,
            (Timer timer) =>
            setState(() {
              print("Activation value is : $activateCountdown");
              if (_start < 1000) {
                activateCountdown = true;
                print("Activation value is : $activateCountdown");
                timer.cancel();
              } else {
                _start = _start - 1000;
              }
              // if (_start < 100) {
              //   timer.cancel();
              // } else {
              //   _start = _start - 400;
              // }
            }));
  }
}



class CustomTimerPainter extends CustomPainter {

  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);

    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);

  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

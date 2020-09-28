import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Concentrate timer",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0),
            ),
            backgroundColor: Colors.redAccent, // Color(0xFF2979FF),
            centerTitle: true),
        body: CTimer());
  }
}

class CTimer extends StatefulWidget {
  @override
  _CTimerState createState() => _CTimerState();
}

class _CTimerState extends State<CTimer> with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  Timer _timer;
  int _start = 60;
  double _interval = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
      _interval = 100 / _start;
    });
    percentageAnimationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, newPercentage, percentageAnimationController.value);
        });
      });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            // _start = 10;
          } else {
            _start = _start - 1;
            percentage = newPercentage;
            newPercentage += _interval;
            if (newPercentage > 100.0) {
              percentage = 0.0;
              newPercentage = 0.0;
            }
            percentageAnimationController.forward(from: 0.0);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300.0,
        width: 200.0,
        child: CustomPaint(
          foregroundPainter: MyPainter(
              lineColor: Colors.redAccent,
              completeColor: Colors.grey,
              completePercent: percentage,
              width: 60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.white70,
              splashColor: Colors.blueAccent,
              shape: CircleBorder(),
              child: Text(
                "$_start",
                style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: 'IBMPlexMono',
                ),
              ),
              onPressed: () => startTimer(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.butt
      // ..style = PaintingStyle.stroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WatchPage(),
    );
  }
}

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(painter: WatchPainter()),
          ),
        ),
      ),
    );
  }
}

class WatchPainter extends CustomPainter {
  //widget size = 1:1
  @override
  void paint(Canvas canvas, Size size) {
    // 1. 초침, 분침, 시침
    // 2. 시간 (1, 2, 3, 4,.... ,12)
    drawHours(canvas, size);

    var now = DateTime.now();
    drawHourTick(now, size, canvas);
    drawMinuteTick(now, size, canvas);
    drawSecondTick(now, size, canvas);

    var center = getCenter(size);
    canvas.drawCircle(center, size.width * 0.01, Paint()..color = Colors.black);
    canvas.drawCircle(
        center, size.width * 0.005, Paint()..color = Colors.white);
  }

  void drawHourTick(DateTime now, Size size, Canvas canvas) {
    var h = now.hour;
    if (h >= 12) h -= 12;

    var hourDegree = h * (2 * pi / 12);

    var minuteDegree = (now.minute / 60) * (pi * 2 / 12);

    var sumDgree = hourDegree + minuteDegree;

    drawTick(canvas, size, sumDgree, size.width * .01, Colors.black54,
        size.width / 2 * .45);
  }

  void drawMinuteTick(DateTime now, Size size, Canvas canvas) {
    var minuteDegree = (now.minute / 60) * (pi * 2);
    var secondDegree = (now.second / 60) * (2 * pi / 60);
    var sumDgree = minuteDegree + secondDegree;
    drawTick(canvas, size, sumDgree, size.width * .03 / 4, Colors.black87,
        size.width / 2 * .57);
  }

  void drawSecondTick(DateTime now, Size size, Canvas canvas) {
    var secondDegree = (now.second / 60) * (2 * pi);
    drawTick(canvas, size, secondDegree, size.width * .0025, Colors.red,
        size.width / 2 * .63);
  }

  double degreeConverter(double degree) {
    return -degree + (pi / 2);
  }

  void drawTick(Canvas canvas, Size size, double degree, double thickness,
      Color color, double length) {
    var center = getCenter(size);
    var o = getOffset(size, degreeConverter(degree), length);

    var p = Paint();
    p.strokeWidth = thickness;
    p.color = color;
    p.style = PaintingStyle.stroke;
    p.strokeCap = StrokeCap.round;

    canvas.drawLine(center, o, p);
  }

  void drawHours(Canvas canvas, Size size) {
    for (var hour = 1; hour < 13; hour++) {
      drawHour(canvas, size, hour);
    }
  }

  void drawHour(Canvas canvas, Size size, int hour) {
    double hourLength = size.width / 2 * .8;
    var degree = degreeConverter((2 * pi) * (hour / 12));
    var o = getOffset(size, degree, hourLength);
    var minWidth = size.width * 0.06;
    var t = TextPainter(
        text: TextSpan(
            text: hour.toString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: minWidth,
                fontWeight: FontWeight.w700)),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    t.layout(minWidth: minWidth);

    var resultOffset = Offset(o.dx - minWidth / 2, o.dy - minWidth / 2);
    t.paint(canvas, resultOffset);
  }

  Offset getOffset(Size size, double degree, double length) {
    Offset center = getCenter(size);
    double x = (cos(degree) * length) + center.dx;
    double y = center.dy - (sin(degree) * length);

    return Offset(x, y);
  }

  Offset getCenter(Size size) {
    return Offset(size.width / 2, size.height / 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

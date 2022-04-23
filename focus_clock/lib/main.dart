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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: CustomPaint(painter: WatchPainter()),
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
  }

  void drawHours(Canvas canvas, Size size) {
    for (var hour = 1; hour < 13; hour++) {
      drawHour(canvas, size, hour);
    }
  }

  void drawHour(Canvas canvas, Size size, int hour) {
    double hourLength = size.width / 2 * .8;
    var degree = (2 * pi) * (-hour / 12) + (pi / 2);
    var o = getOffset(size, degree, hourLength);
    var minWidth = 20.0;
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
    t.paint(canvas, o);
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

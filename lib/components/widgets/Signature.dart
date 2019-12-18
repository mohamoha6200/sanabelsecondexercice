import 'package:flutter/material.dart';

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;
    //paint.style = PaintingStyle.stroke; //circle
    paint.style = PaintingStyle.fill; //Line
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
        //print(size.width / 15);
        // canvas.drawCircle(points[i], size.width / 15, paint);

        
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}

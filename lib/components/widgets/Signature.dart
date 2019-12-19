import 'package:flutter/material.dart';

class Signature extends CustomPainter {
  List<Offset> points;
  List<Offset> trues;

  Signature({this.points , this.trues});


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
     // ..strokeWidth = size.width / 200; //for circle
     ..strokeWidth = size.width / 150; //fir line

    paint.style = PaintingStyle.stroke; //circle
    //paint.style = PaintingStyle.fill; //Line
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
        // print(size.width / 15);
        //  canvas.drawCircle(points[i], size.width / 15, paint);
         
        
      }
    }
    for (int i = 0; i < trues.length - 1; i++) {
      if (trues[i] != null && trues[i + 1] != null) {
        canvas.drawLine(trues[i], trues[i + 1], paint);
        // print(size.width / 15);
        //  canvas.drawCircle(points[i], size.width / 15, paint);
         
        
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}

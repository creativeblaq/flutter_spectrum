import 'dart:ui';

import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final Color color;
  final bool isVertical;

  DashedLinePainter({this.color = Colors.blueGrey, this.isVertical = true});
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    if (isVertical) {
      while (startX < size.height) {
        canvas.drawLine(
            Offset(0, startX), Offset(0, startX + dashWidth), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startX < size.width) {
        canvas.drawLine(
            Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

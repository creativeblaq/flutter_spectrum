import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  MediaQueryData get mq => MediaQuery.of(this);
  Size get size => mq.size;

  double get width => size.width;
  double get height => size.height;
}

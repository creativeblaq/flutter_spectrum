import 'package:flutter/material.dart';

extension WidgetEx on Widget {
  Padding pad(EdgeInsets insets) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

import 'package:flutter/material.dart';

/// An extension on the [Widget] class to provide additional utility methods.
///
/// This extension adds the `pad` method, which can be used to add padding to a widget
/// using the [Padding] widget. The [pad] method takes an [EdgeInsets] parameter
/// to specify the amount of padding to apply to the widget.
///
/// Example usage:
/// ```dart
/// Container().pad(EdgeInsets.all(16.0));
///

extension WidgetEx on Widget {
  Padding pad(EdgeInsets insets) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

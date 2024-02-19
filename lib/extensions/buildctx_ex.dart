import 'package:flutter/material.dart';

/// An extension on the [BuildContext] class to provide additional utility methods.
///
/// This extension adds the following getters to access common properties of [BuildContext]:
/// - [theme]: Returns the [ThemeData] of the current [BuildContext].
/// - [colors]: Returns the [ColorScheme] of the current [BuildContext].
/// - [mq]: Returns the [MediaQueryData] of the current [BuildContext].
/// - [size]: Returns the [Size] of the current [BuildContext].
/// - [width]: Returns the width of the current [BuildContext].
/// - [height]: Returns the height of the current [BuildContext].
///
/// Example usage:
/// ```dart
/// BuildContext context = ...;
/// ThemeData theme = context.theme;
/// ColorScheme colors = context.colors;
/// MediaQueryData mq = context.mq;
/// Size size = context.size;
/// double width = context.width;
/// double height = context.height;
///

extension BuildContextEx on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  MediaQueryData get mq => MediaQuery.of(this);
  Size get size => mq.size;

  double get width => size.width;
  double get height => size.height;
}

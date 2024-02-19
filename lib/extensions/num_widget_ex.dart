import 'package:flutter/material.dart';

/// An extension on the [num] class to provide additional utility methods for widgets.
///
/// This extension adds utility methods that allow you to easily create widgets with
/// specific dimensions or padding based on a numeric value.
///
/// Methods:
/// - `roundedShape`: Creates a [RoundedRectangleBorder] with rounded corners,
///   with an optional [Color] to set the border color.
/// - `roundedRadius`: Returns a [BorderRadius] with a circular radius based on the numeric value.
/// - `hBox`: Returns a [SizedBox] with a fixed height based on the numeric value.
/// - `wBox`: Returns a [SizedBox] with a fixed width based on the numeric value.
/// - `pA`: Returns an [EdgeInsets] with equal padding on all sides based on the numeric value.
/// - `pb`: Returns an [EdgeInsets] with bottom padding based on the numeric value.
/// - `pt`: Returns an [EdgeInsets] with top padding based on the numeric value.
/// - `pl`: Returns an [EdgeInsets] with left padding based on the numeric value.
/// - `pr`: Returns an [EdgeInsets] with right padding based on the numeric value.
/// - `ph`: Returns an [EdgeInsets] with horizontal padding based on the numeric value.
extension NumWidgetEx on num {
  RoundedRectangleBorder roundedShape({Color? color}) {
    return RoundedRectangleBorder(
        side: color != null ? BorderSide(color: color) : BorderSide.none,
        borderRadius: roudedRadius);
  }

  BorderRadius get roudedRadius {
    return BorderRadius.circular(toDouble());
  }

  SizedBox get hBox {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox get wBox {
    return SizedBox(
      width: toDouble(),
    );
  }

  EdgeInsets get pA {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get pb {
    return EdgeInsets.only(bottom: toDouble());
  }

  EdgeInsets get pt {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets get pl {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets get pr {
    return EdgeInsets.only(right: toDouble());
  }

  EdgeInsets get ph {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  EdgeInsets get pv {
    return EdgeInsets.symmetric(vertical: toDouble());
  }
}

import 'package:flutter/material.dart';

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

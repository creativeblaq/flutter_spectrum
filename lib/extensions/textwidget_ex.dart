import 'package:flutter/material.dart';

extension TextEx on Text {
  //Default style
  Text _withDefaultStyle([TextStyle? newStyle]) {
    return Text(
      data!,
      style: style?.merge(newStyle) ?? const TextStyle().merge(newStyle),
    );
  }

  Text get headLrg {
    return _withDefaultStyle(const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ));
  }

  Text get headMed {
    return _withDefaultStyle(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text get headSm {
    return _withDefaultStyle(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text get body {
    return _withDefaultStyle(
      const TextStyle(
        fontSize: 14,
      ),
    );
  }

  Text get bodySm {
    return _withDefaultStyle(
      const TextStyle(
        fontSize: 12,
      ),
    );
  }

  Text get labelSm {
    return _withDefaultStyle(
      const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  //*=======Modifiers=======
  Text fontSize(double newSize) {
    return _withDefaultStyle(
      TextStyle(
        fontSize: newSize,
      ),
    );
  }

  Text color(Color newColor) {
    return _withDefaultStyle(
      TextStyle(
        color: newColor,
      ),
    );
  }

  Text get bold {
    return _withDefaultStyle(
      const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text weight(FontWeight weight) {
    return _withDefaultStyle(
      TextStyle(
        fontWeight: weight,
      ),
    );
  }

  //*=========Alignment=======
  //Default alignment
  Text _withAlignment(TextAlign alignment) {
    return Text(
      data!,
      style: style,
      textAlign: alignment,
    );
  }

  //Align left
  Text get alignLeft {
    return _withAlignment(TextAlign.left);
  }

  //Align right
  Text get alignRight {
    return _withAlignment(TextAlign.right);
  }

  //Align center
  Text get alignCenter {
    return _withAlignment(TextAlign.center);
  }

  //Align justify
  Text get alignJustify {
    return _withAlignment(TextAlign.justify);
  }

  //Align start
  Text get alignStart {
    return _withAlignment(TextAlign.start);
  }

  //Align end
  Text get alignEnd {
    return _withAlignment(TextAlign.end);
  }
}

extension StringToTextEx on String {
  Text get headLrg {
    return Text(this).headLrg;
  }

  Text get headMed {
    return Text(this).headMed;
  }

  Text get headSm {
    return Text(this).headSm;
  }

  Text get body {
    return Text(this).body;
  }

  Text get bodySm {
    return Text(this).bodySm;
  }

  Text get labelSm {
    return Text(this).labelSm;
  }
}

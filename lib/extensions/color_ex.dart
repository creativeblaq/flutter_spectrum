import 'package:flutter/material.dart';

/// An extension on the [Color] class to provide additional color formatting functionality.
///
/// This extension adds the `toColor` method, which converts a hex color string to a [Color] object.
///
/// Example usage:
/// ```dart
/// Color color = '#FF0000'.toColor;
/// print(color); // prints Color(0xFFFF0000)
/// ```

extension ColorEx on String {
  //Get color from hex
  Color get toColor {
    // Remove the '#' symbol from the hex color string.
    var hexColor = replaceAll("#", "").replaceAll(" ", '');

    if (hexColor.length == 3) {
      // If the hex color is in short format (e.g., #RGB), check its length.

      // Create a new variable 'car' by doubling each character in the hexColor.
      var car = hexColor.characters.map((e) => e + e).toList().toString();

      // Update 'hexColor' by adding 'FF' to the beginning and removing any commas and spaces.
      hexColor =
          "FF${car.substring(1, car.length - 1).replaceAll(',', '').replaceAll(' ', '')}";
    }

    if (hexColor.length == 6) {
      // If the hex color is already in the long format (e.g., #RRGGBB), add the alpha channel (e.g., #AARRGGBB).
      hexColor = "FF$hexColor";
    }

    if (hexColor.length == 8) {
      // If the hex color includes the alpha channel (e.g., #AARRGGBB), parse it to create a Color object.
      return Color(int.parse(hexColor, radix: 16));
    }

    // If the input is not a valid hex color, return a transparent color.
    return Colors.transparent;
  }
}

/// An extension on the [Color] class to provide additional color formatting functionality.
/// This extension adds the `toHex` method, which converts a color to its hexadecimal representation.
/// `getTextColor` method, which returns the text color based on the color.
/// `changeColorLightness` method, which changes the color's lightness.
/// `darken` method, which darkens the color.
/// `lighten` method, which lightens the color.
/// Example usage:
/// ```dart
/// Color color = Colors.red;
/// String hex = color.toHex();
/// print(hex); // prints "#FF0000"
/// Color textColor = color.getTextColor();
/// Color lightenedColor = color.changeColorLightness(0.5);
/// Color darkenedColor = color.darken(0.2);
/// Color lightenedColor = color.lighten(0.2);
/// ```
///

extension ColorExtensions on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) {
    var value = '';
    value = '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';

    final splitVal = value.split('#')[1];
    if (splitVal.length >= 8) {
      if (splitVal.toLowerCase().startsWith('ff')) {
        return '#${splitVal.substring(2)}';
      }
    }
    return value;
  }

  Color getTextColor({bool reversed = false}) {
    return (reversed ? (computeLuminance() > 0.5) : (computeLuminance() < 0.5))
        ? lighten(0.8)
        : darken(0.8);
  }

  Color changeColorLightness(double lightness) =>
      HSLColor.fromColor(this).withLightness(lightness).toColor();

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

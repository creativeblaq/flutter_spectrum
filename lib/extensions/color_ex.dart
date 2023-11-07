import 'package:flutter/material.dart';

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

import 'package:flutter/material.dart';

Color parseColor(String colorString) {
  try {
    // Extract the hexadecimal value
    String hexValue = colorString.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');

    // Check if the hexValue is a valid 6-character hexadecimal string
    if (hexValue.length == 6) {
      // Parse the hex string to an integer
      int intValue = int.parse(hexValue, radix: 16);

      // Create a Color object
      return Color(intValue);
    } else {
      // If the hexValue is not a valid 6-character hexadecimal string,
      // return a default color or handle it according to your requirements.
      return Colors.grey; // You can replace this with your default color.
    }
  } catch (e) {
    // If any error occurs during parsing, return a default color or handle it accordingly.
    return Colors.grey; // You can replace this with your default color.
  }
}

import 'dart:math';

// convert double points to short points
// like two decimal points 20.12 number from 20.121983242
class Convert {
  static double decimalendpointsf(double value, int scale) {
    final multiplier = pow(10, scale.toDouble());
    return (value * multiplier).ceil() / multiplier;
  }
}

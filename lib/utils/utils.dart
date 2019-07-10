import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static Color nameToColor(String name) {
    // assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }
}
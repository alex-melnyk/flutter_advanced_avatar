import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

/// Offset utility extension.
extension OffsetUtils on Offset {
  /// Returns Offset based on [angle] and [radius].
  static Offset angleToOffset(double angle, {double radius = 0.0}) {
    return Offset(
      radius * sin(pi * 2 * angle / 360) + radius,
      radius * -cos(pi * 2 * angle / 360) + radius,
    );
  }
}

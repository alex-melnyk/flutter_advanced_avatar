import 'dart:math';

import 'package:flutter/widgets.dart';

/// The [Alignment] utility extension.
extension AlignmentExtension on Alignment {
  /// Converts the alignment to an [Offset] instance.
  Offset toOffsetWithRadius({double radius = 0.0}) {
    final angle = atan2(y, x);
    final polarRadius = radius * min(1.0, sqrt(x * x + y * y));
    final offsetX = polarRadius * cos(angle) + radius;
    final offsetY = polarRadius * sin(angle) + radius;
    return Offset(offsetX, offsetY);
  }
}

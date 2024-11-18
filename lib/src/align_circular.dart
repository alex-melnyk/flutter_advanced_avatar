import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

/// Common positioned widget wrapper.
class AlignCircular extends StatelessWidget {
  const AlignCircular({
    super.key,
    required this.child,
    this.alignment = Alignment.center,
    this.radius = 0.0,
    this.size = Size.zero,
  });

  /// The [child] alignment.
  final Alignment alignment;

  /// The parent widget radius.
  final double radius;

  /// The [child] widget size is required to use with [GestureDetector]
  /// in the child tree.
  ///
  /// Notice: this widget builds [Positioned] with zero size
  /// to center the [child] at [alignment] on the parent widget
  /// but gesture detection such as [GestureDetector] won't work with zero size.
  final Size size;

  /// Child widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final offset = alignment.toOffsetWithRadius(
      radius: AdvancedAvatarInherited.of(context)?.radius ?? radius,
    );

    return Positioned(
      width: size.width,
      height: size.height,
      left: offset.dx - size.width / 2.0,
      top: offset.dy - size.height / 2.0,
      child: OverflowBox(
        alignment: Alignment.center,
        minWidth: 0,
        minHeight: 0,
        maxWidth: double.maxFinite,
        maxHeight: double.maxFinite,
        child: child,
      ),
    );
  }
}

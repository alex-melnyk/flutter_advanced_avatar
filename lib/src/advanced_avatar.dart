import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

import 'align_circular.dart';
import 'string_extension.dart';

part 'advanced_avatar_inherited.dart';

/// Advanced Avatar widget.
class AdvancedAvatar extends StatelessWidget {
  const AdvancedAvatar({
    Key? key,
    this.name,
    this.size = 80.0,
    this.image,
    this.margin,
    this.style,
    this.statusColor,
    this.statusSize = 12.0,
    this.statusAlignment = Alignment.bottomRight,
    this.decoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
    this.foregroundDecoration,
    this.child,
    this.children = const <Widget>[],
    this.animated = false,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  /// Used for creating initials. (Regex split by r'\s+\/')
  final String? name;

  /// Avatar size (width = height).
  final double size;

  /// Avatar image source exclusively with [child].
  final ImageProvider<Object>? image;

  /// Avatar margin.
  final EdgeInsetsGeometry? margin;

  /// Initials text style.
  final TextStyle? style;

  /// Status color.
  final Color? statusColor;

  /// Status size.
  final double statusSize;

  /// Status angle.
  final Alignment statusAlignment;

  /// Avatar decoration.
  final BoxDecoration decoration;

  /// Avatar foreground decoration.
  final BoxDecoration? foregroundDecoration;

  /// Child widget exclusively with [image].
  final Widget? child;

  /// Children widgets.
  final List<Widget> children;

  /// Use AnimatedContainer.
  final bool animated;

  /// AnimatedContainer duration.
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final sourceChild = DefaultTextStyle(
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ).merge(style),
      child: child == null
          ? image == null
              ? Text(name.toAbbreviation())
              : Image(
                  image: image!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Text(name.toAbbreviation()),
                )
          : child!,
    );

    return UnconstrainedBox(
      child: AdvancedAvatarInherited(
        radius: size / 2.0,
        child: Container(
          width: size,
          height: size,
          margin: margin,
          child: Stack(
            children: [
              if (animated)
                AnimatedContainer(
                  duration: duration,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: decoration,
                  foregroundDecoration: foregroundDecoration,
                  child: sourceChild,
                )
              else
                Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: decoration,
                  foregroundDecoration: foregroundDecoration,
                  child: sourceChild,
                ),
              if (statusColor != null)
                AlignCircular(
                  alignment: statusAlignment,
                  child: Container(
                    width: statusSize,
                    height: statusSize,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              for (final child in children) child,
            ],
          ),
        ),
      ),
    );
  }
}

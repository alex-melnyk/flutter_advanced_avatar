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
    this.decoration,
    this.foregroundDecoration,
    this.child,
    this.children = const <Widget>[],
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
  final BoxDecoration? decoration;

  /// Avatar foreground decoration.
  final BoxDecoration? foregroundDecoration;

  /// Child widget exclusively with [image].
  final Widget? child;

  /// Children widgets.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: AdvancedAvatarInherited(
        radius: size / 2.0,
        child: Container(
          width: size,
          height: size,
          margin: margin,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: decoration ??
                    const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      shape: BoxShape.circle,
                    ),
                foregroundDecoration: foregroundDecoration,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ).merge(style),
                  child: child != null
                      ? child!
                      : image != null
                          ? Image(
                              image: image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(name.toAbbreviation());
                              },
                            )
                          : Text(name.toAbbreviation()),
                ),
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

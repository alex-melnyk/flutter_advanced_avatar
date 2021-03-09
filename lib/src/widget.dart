part of '../flutter_advanced_avatar.dart';

/// Advanced Avatar widget.
class AdvancedAvatar extends StatelessWidget {
  AdvancedAvatar({
    Key key,
    this.name,
    this.size = 80.0,
    this.image,
    this.margin,
    this.style,
    this.statusColor,
    this.statusSize = 12.0,
    this.statusAngle = 135.0,
    this.decoration,
    this.foregroundDecoration,
    this.child,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  }) : super(key: key);

  /// Used for creating initials. (Regex split by r'\s+\/')
  final String name;

  /// Avatar size (width = height).
  final double size;

  /// Avatar image source exclusively with [child].
  final ImageProvider<dynamic> image;

  /// Avatar margin.
  final EdgeInsetsGeometry margin;

  /// Initials text style.
  final TextStyle style;

  /// Status color.
  final Color statusColor;

  /// Status size.
  final double statusSize;

  /// Status angle.
  final double statusAngle;

  /// Avatar decoration.
  final BoxDecoration decoration;

  /// Avatar foreground decoration.
  final BoxDecoration foregroundDecoration;

  /// Child widget exclusively with [image].
  final Widget child;

  /// Top-left hosted widget.
  final Widget topLeft;

  /// Top-right hosted widget.
  final Widget topRight;

  /// Bottom-left hosted widget.
  final Widget bottomLeft;

  /// Bottom-right hosted widget.
  final Widget bottomRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return UnconstrainedBox(
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
                  BoxDecoration(
                    color: theme.backgroundColor,
                    shape: BoxShape.circle,
                  ),
              foregroundDecoration: foregroundDecoration,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onBackground,
                ).merge(style),
                child: child != null
                    ? child
                    : image != null
                        ? Image(
                            image: image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(name.toAbbreviation());
                            },
                          )
                        : Text(name.toAbbreviation()),
              ),
            ),
            if (statusColor != null)
              CornerBox(
                offset: OffsetUtils.angleToOffset(
                  statusAngle,
                  radius: size / 2,
                ),
                child: Container(
                  width: statusSize,
                  height: statusSize,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: theme.dividerTheme.thickness ?? 0.5,
                    ),
                  ),
                ),
              ),
            if (topLeft != null)
              CornerBox(
                offset: OffsetUtils.angleToOffset(
                  315.0,
                  radius: size / 2,
                ),
                child: topLeft,
              ),
            if (topRight != null)
              CornerBox(
                offset: OffsetUtils.angleToOffset(
                  45.0,
                  radius: size / 2,
                ),
                child: topRight,
              ),
            if (bottomLeft != null)
              CornerBox(
                offset: OffsetUtils.angleToOffset(
                  135.0,
                  radius: size / 2,
                ),
                child: bottomLeft,
              ),
            if (bottomRight != null)
              CornerBox(
                offset: OffsetUtils.angleToOffset(
                  225,
                  radius: size / 2,
                ),
                child: bottomRight,
              ),
          ],
        ),
      ),
    );
  }
}

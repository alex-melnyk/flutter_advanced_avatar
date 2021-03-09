part of '../flutter_advanced_avatar.dart';

class AdvancedAvatar extends StatelessWidget {
  AdvancedAvatar({
    Key key,
    @required this.fullName,
    this.color,
    this.shadow = false,
    this.size = AdvanceAvatarSize.medium,
    this.image,
    this.margin,
    this.style,
    this.statusColor,
  }) : super(key: key);

  static const statusAngle = 135.0;
  final String fullName;
  final Color color;
  final bool shadow;
  final AdvanceAvatarSize size;
  final ImageProvider<dynamic> image;
  final EdgeInsetsGeometry margin;
  final TextStyle style;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final position = OffsetUtils.angleToOffset(
      statusAngle,
      radius: size.container / 2,
    );

    return Container(
      width: size.container,
      height: size.container,
      margin: margin,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color ?? theme.canvasColor,
              shape: BoxShape.circle,
              boxShadow: [
                if (shadow)
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                  ),
              ],
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: size.text,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.primary,
              ).merge(style),
              child: image != null
                  ? Image(
                      image: image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Text(
                        fullName.toAbbreviation(),
                      ),
                    )
                  : Text(fullName.toAbbreviation()),
            ),
          ),
          if (statusColor != null)
            Positioned(
              left: position.dx - size.status / 2,
              top: position.dy - size.status / 2,
              child: Container(
                width: size.status,
                height: size.status,
                decoration: BoxDecoration(
                  color: statusColor ?? Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

part of 'advanced_avatar.dart';

class AdvancedAvatarInherited extends InheritedWidget {
  const AdvancedAvatarInherited({
    Key? key,
    required Widget child,
    required this.radius,
  }) : super(key: key, child: child);

  final double radius;

  static AdvancedAvatarInherited? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AdvancedAvatarInherited>();
  }

  @override
  bool updateShouldNotify(AdvancedAvatarInherited oldWidget) {
    return oldWidget.radius != radius;
  }
}

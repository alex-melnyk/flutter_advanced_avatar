part of 'advanced_avatar.dart';

class AdvancedAvatarInherited extends InheritedWidget {
  const AdvancedAvatarInherited({
    super.key,
    required super.child,
    required this.radius,
  });

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

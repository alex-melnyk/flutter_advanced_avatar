part of '../flutter_advanced_avatar.dart';

class AdvanceAvatarSize {
  const AdvanceAvatarSize._(
    this.container,
    this.status,
    this.text,
  );

  final double container;
  final double status;
  final double text;

  static const AdvanceAvatarSize small = AdvanceAvatarSize._(
    24,
    8.0,
    10,
  );
  static const AdvanceAvatarSize medium = AdvanceAvatarSize._(
    40,
    12,
    14,
  );
  static const AdvanceAvatarSize large = AdvanceAvatarSize._(
    64,
    12,
    20,
  );
}

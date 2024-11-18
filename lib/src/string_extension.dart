import 'package:characters/characters.dart';

enum AvatarMinLength {
  one,
  two;

  bool get isOne => this == one;

  bool get isTwo => this == two;
}

/// String utility extension.
extension StringExtension on String? {
  /// Returns a string abbreviation.
  String toAbbreviation([AvatarMinLength minLength = AvatarMinLength.one]) {
    final trimmed = this?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return '';
    }

    final nameParts = trimmed.toUpperCase().split(RegExp(r'[\s/]+'));

    if (nameParts.length > 1) {
      return nameParts.first.characters.first + nameParts[1].characters.first;
    }

    return nameParts.first.characters.length > 1
        ? nameParts.first.characters.take(2).string
        : nameParts.first.characters.first;
  }
}

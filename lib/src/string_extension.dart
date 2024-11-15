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
    if (this == null) {
      return '';
    }

    final nameParts = this!.trim.call().toUpperCase().split(RegExp(r'[\s/]+'));

    if (nameParts.length > 1) {
      return nameParts.first.characters.first + nameParts[1].characters.first;
    }

    return nameParts.first.characters.length > 1
        ? nameParts.first.characters.take(2).string
        : nameParts.first.characters.first;
  }
}

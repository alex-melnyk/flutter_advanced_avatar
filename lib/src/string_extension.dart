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
      return nameParts.first.substring(0, 1) + nameParts[1].substring(0, 1);
    }

    return nameParts.first.length > 1
        ? nameParts.first.substring(0, 2)
        : nameParts.first;
  }
}

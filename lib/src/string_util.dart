/// String utility extension.
extension StringUtils on String? {
  /// Returns a string abbreviation.
  String toAbbreviation() {
    if (this == null) {
      return '';
    }

    final nameParts = this!.trim().toUpperCase().split(RegExp(r'[\s\/]+'));

    if (nameParts.length > 1) {
      return nameParts.first.substring(0, 1) + nameParts.last.substring(0, 1);
    }

    return nameParts.first.substring(0, 1);
  }
}

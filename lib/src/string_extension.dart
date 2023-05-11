/// String utility extension.
extension StringExtension on String? {
  /// Returns a string abbreviation.
  String toAbbreviation() {
    if (this == null) {
      return '';
    }

    final nameParts = this!.trim.call().toUpperCase().split(RegExp(r'[\s/]+'));

    if (nameParts.length > 1) {
      return nameParts.first.substring(0, 1) + nameParts[1].substring(0, 1);
    }

    return nameParts.first.substring(0, 1);
  }
}

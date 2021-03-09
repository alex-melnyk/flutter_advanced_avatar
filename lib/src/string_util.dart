part of '../flutter_advanced_avatar.dart';

/// String utility extension.
extension StringUtils on String {
  /// Returns a string abbreviation.
  String toAbbreviation() {
    final nameParts = trim().toUpperCase().split(RegExp(r'[\s\/]+'));

    if (nameParts.length > 1) {
      return nameParts.first.substring(0, 1) + nameParts.last.substring(0, 1);
    }

    return nameParts.first.substring(0, 1);
  }
}

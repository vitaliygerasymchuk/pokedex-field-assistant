extension StringPresentation on String {
  String get capitalized {
    if (isEmpty) return this;
    final spaced = replaceAll('-', ' ');
    return '${spaced[0].toUpperCase()}${spaced.substring(1)}';
  }
}
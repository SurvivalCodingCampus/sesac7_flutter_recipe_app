extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return substring(0, 1).toUpperCase() + substring(1);
  }
}

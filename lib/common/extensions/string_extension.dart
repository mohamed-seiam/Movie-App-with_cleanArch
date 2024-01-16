extension StringExtension on String {
  String initialTrim() {
    return length > 15 ? '${substring(0,15)}...': this;
  }
}
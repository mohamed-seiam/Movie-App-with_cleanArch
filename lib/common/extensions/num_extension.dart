extension NumExtension on num {
  String convertToPercentString() {
    return '${((this)*10).toStringAsFixed(0)} %';
  }
}
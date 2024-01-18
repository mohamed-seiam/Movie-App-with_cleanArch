
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/app_localization.dart';

extension StringExtension on String {
  String initialTrim() {
    return length > 15 ? '${substring(0,15)}...': this;
  }
  String t(BuildContext context) {
    return AppLocalization.of(context)!.translate(this)!;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/pngs/logo.png',
      height: height.h,
    );
  }
}

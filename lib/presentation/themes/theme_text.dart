import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

import '../../common/constance/size_constance.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 =>
      _poppinsTextTheme.titleLarge!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );

  static TextStyle get whiteSubTitle1 =>
      _poppinsTextTheme.titleMedium!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: Sizes.dimen_14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get whiteHeadline5 =>
      _poppinsTextTheme.headlineSmall!.copyWith(
        color: Colors.white,
        fontSize: Sizes.dimen_24.sp,
      );

  static TextStyle get whiteButton => _poppinsTextTheme.labelLarge!.copyWith(
        color: Colors.white,
        fontSize: Sizes.dimen_14.sp,
      );

  static getTextTheme() => TextTheme(
        titleLarge: _whiteHeadline6,
        titleMedium: whiteSubTitle1,
        bodyMedium: whiteBodyText2,
        headlineSmall: whiteHeadline5,
        labelLarge: whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubTitle1 => titleMedium!.copyWith(
        color: AppColors.royalBlue,
        fontWeight: FontWeight.w600,
      );
}

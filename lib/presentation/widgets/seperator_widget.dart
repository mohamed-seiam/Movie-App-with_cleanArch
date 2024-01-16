import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';

import '../themes/app_colors.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(top: Sizes.dimen_2.h, bottom: Sizes.dimen_6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
          gradient: const LinearGradient(colors: [
            AppColors.violet,
            AppColors.royalBlue,
          ])),
    );
  }
}

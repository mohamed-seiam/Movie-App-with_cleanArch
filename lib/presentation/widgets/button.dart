import 'package:flutter/material.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.royalBlue,
            AppColors.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import '../../themes/app_colors.dart';

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.isSelected = false});

  final String title;
  final  Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.royalBlue:Colors.transparent,
              width: Sizes.dimen_1.h,
            )
          )
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubTitle1
              : Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

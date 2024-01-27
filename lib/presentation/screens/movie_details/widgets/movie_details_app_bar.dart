import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constance/size_constance.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_20.h,
          ),
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_20.h,
        ),
      ],
    );
  }
}

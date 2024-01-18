import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget(
      {super.key, required this.movieId, required this.posterPath});

  final int movieId;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      color: AppColors.violet.withOpacity(0.4),
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: (){},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            errorWidget: (context,error,object){
            return const Center(child: Icon(Icons.error),) ;
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

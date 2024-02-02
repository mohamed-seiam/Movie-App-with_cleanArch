import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/presentation/screens/loading/loading_circle.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

import '../../movie_details/movie_details_arguments.dart';
class SectionCardItem extends StatelessWidget {
  const SectionCardItem(
      {super.key,
        required this.movieId,
        required this.title,
        required this.posterPath});

  final int movieId;
  final String title, posterPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesList.movieDetail,
            arguments: MovieDetailsArguments(movieId: movieId));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(Sizes.dimen_16.w),
          border: Border.all(
            color: AppColors.royalBlue,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 2.5/3.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                    fit: BoxFit.cover,
                    errorWidget: (context,object,url){
                      return const Center(child: Icon(Icons.error,color: Colors.white,),);
                    },
                    placeholder: (context,object){
                      return Center(child: LoadingCircle(size: Sizes.dimen_200.w),);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_4.h),
              child: Text(
                title.initialTrim(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

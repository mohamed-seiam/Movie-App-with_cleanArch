import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/presentation/screens/loading/loading_circle.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_arguments.dart';
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
        onTap: () {
          Navigator.pushNamed(context, RoutesList.movieDetail,
              arguments: MovieDetailsArguments(movieId: movieId));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            errorWidget: (context, error, object) {
              return const Center(
                child: Icon(Icons.error),
              );
            },
            placeholder: (context,object){
              return LoadingCircle(size:Sizes.dimen_200.w);
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

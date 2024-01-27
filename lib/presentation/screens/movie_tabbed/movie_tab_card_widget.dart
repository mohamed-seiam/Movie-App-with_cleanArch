import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/data/core/api_constance.dart';

import '../movie_details/movie_details_arguments.dart';
import '../movie_details/movie_details_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  const MovieTabCardWidget(
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movieDetailsArguments: MovieDetailsArguments(movieId: movieId),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
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
    );
  }
}

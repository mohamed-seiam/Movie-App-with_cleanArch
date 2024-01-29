import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesList.movieDetail,
            arguments: MovieDetailsArguments(movieId: movie.id));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_2.w,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    );
                  },
                  width: Sizes.dimen_80.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    movie.overView!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

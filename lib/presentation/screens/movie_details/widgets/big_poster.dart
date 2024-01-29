import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/extensions/num_extension.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import 'movie_details_app_bar.dart';

class BigPoster extends StatelessWidget {
  const BigPoster({super.key, required this.movieDetails, required this.favoriteMoviesBloc});
final FavoriteMoviesBloc favoriteMoviesBloc;
  final MovieDetailsEntity movieDetails;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl:
                '${ApiConstants.BASE_IMAGE_URL}${movieDetails.posterPath}',
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movieDetails.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              movieDetails.releaseDate!,
              style: Theme.of(context).textTheme.greySubTitle,
            ),
            trailing: Text(
              movieDetails.voteAverage!.convertToPercentString(),
              style: Theme.of(context).textTheme.violetHeadLine,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: MediaQuery.of(context).padding.top + Sizes.dimen_4.h,
          child: MovieDetailAppBar(movieDetailsEntity: movieDetails,favoriteMoviesBloc: favoriteMoviesBloc,),
        ),
      ],
    );
  }
}

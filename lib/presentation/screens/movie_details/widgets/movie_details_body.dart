import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movies_app/presentation/screens/movie_details/widgets/video_widget.dart';

import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.movieDetails, required this.videosBloc, required this.favoriteMoviesBloc});
  final MovieDetailsEntity movieDetails;
  final FavoriteMoviesBloc favoriteMoviesBloc;
final VideosBloc videosBloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BigPoster(
          movieDetails: movieDetails,
          favoriteMoviesBloc: favoriteMoviesBloc,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16.w,
            vertical: Sizes.dimen_8.h,
          ),
          child: Text(
            movieDetails.overView,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
          child: Text(
            TranslationConstance.cast.t(context),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
       const CastWidget(),
        VideosWidget(videosBloc:videosBloc),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';

import '../../../../common/constance/size_constance.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar(
      {super.key, required this.movieDetailsEntity, required this.favoriteMoviesBloc});

  final FavoriteMoviesBloc favoriteMoviesBloc;
  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_20.h,
          ),
        ),
        BlocProvider(
          create: (context) =>favoriteMoviesBloc,
          child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
            builder: (context, state) {
              if (state is IsFavoriteMovie) {
                return GestureDetector(
                  onTap: () {
                    print('tabbedFromFavorites');
                    BlocProvider.of<FavoriteMoviesBloc>(context).add(
                      ToggleFavoriteMovieEvent(
                        movieEntity: MovieEntity.fromMovieDetailsEntity(
                            movieDetailsEntity),
                        isFavorite: state.isFavorite,
                      ),
                    );
                  },
                  child: Icon(
                    state.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: Sizes.dimen_20.h,
                  ),
                );
              } else {
                return  Icon(
                   Icons.favorite,
                  color: Colors.white,
                  size: Sizes.dimen_20.h,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_screen.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  const FavoriteMovieCardWidget({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieDetailsArguments: MovieDetailsArguments(movieId: movie.id),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_160.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteMoviesBloc>(context).add(
                    DeleteFavoriteMovieEvent(movieId: movie.id),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_16.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

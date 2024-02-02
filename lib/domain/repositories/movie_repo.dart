import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/video_entity.dart';

import '../entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending({required int pageNumber});

  Future<Either<AppError, List<MovieEntity>>> getPopular({required int pageNumber});

  Future<Either<AppError, List<MovieEntity>>> getPlayingNow({required int pageNumber});

  Future<Either<AppError, List<MovieEntity>>> getComingSoon({required int pageNumber});

  Future<Either<AppError, MovieDetailsEntity>> getMovieDetails(int id);

  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);

  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);

  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(
      String searchQuery);

  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);

  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();

  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
  Future<Either<AppError,bool>> checkIfMovieFavorite(int movieId);

}

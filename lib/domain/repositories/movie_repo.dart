import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/video_entity.dart';

import '../entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();

  Future<Either<AppError, List<MovieEntity>>> getPopular();

  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>>> getComingSoon();

  Future<Either<AppError, MovieDetailsEntity>> getMovieDetails(int id);

  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);

  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);

  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(
      String searchQuery);
}

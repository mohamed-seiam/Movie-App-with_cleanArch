import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

import '../entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getComingSoon();

}

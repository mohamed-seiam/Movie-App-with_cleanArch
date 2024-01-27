import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../repositories/movie_repo.dart';

class GetMovieDetails extends UseCase<MovieDetailsEntity,MovieParams> {
  final MovieRepository movieRepository;
  GetMovieDetails({required this.movieRepository});
  @override
  Future<Either<AppError,MovieDetailsEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetails(params.id);
  }
}
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class CheckIfFavoriteMovie extends UseCase<void, MovieParams> {
  MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepository.checkIfMovieFavorite(params.id);
  }
}

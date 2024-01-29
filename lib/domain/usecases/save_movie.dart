import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie({required this.movieRepository});

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
  return  await movieRepository.saveMovie(params);
  }
}

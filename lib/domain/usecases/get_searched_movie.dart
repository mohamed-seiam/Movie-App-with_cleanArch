import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/movie_search_params.dart';

class GetSearchedMovie extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository movieRepository;

  GetSearchedMovie({required this.movieRepository});

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams params) async {
    return await movieRepository.getSearchedMovie(params.searchQuery);
  }
}

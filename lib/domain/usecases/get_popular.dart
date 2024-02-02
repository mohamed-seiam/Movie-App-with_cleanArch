import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repo.dart';

class GetPopular extends UseCase<List<MovieEntity>,int> {
  final MovieRepository movieRepository;
  GetPopular({required this.movieRepository});
  @override
  Future<Either<AppError, List<MovieEntity>>> call(int params) async {
    return await movieRepository.getPopular(pageNumber: params);
  }
}
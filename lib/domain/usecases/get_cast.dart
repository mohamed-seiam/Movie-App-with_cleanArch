import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../repositories/movie_repo.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetCast({required this.movieRepository});

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await movieRepository.getCastCrew(params.id);
  }
}

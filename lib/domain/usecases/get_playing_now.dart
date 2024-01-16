import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repo.dart';

class GetPlayingNow  extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepository movieRepository;
  GetPlayingNow({required this.movieRepository});
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getPlayingNow();
  }
}
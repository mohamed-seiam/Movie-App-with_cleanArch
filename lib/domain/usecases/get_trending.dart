import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>,int> {
  final MovieRepository movieRepository;

  GetTrending({required this.movieRepository});
@override
  Future<Either<AppError, List<MovieEntity>>> call(int params) async {
    return await movieRepository.getTrending(pageNumber: params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  AppRepository appRepository;

  GetPreferredLanguage({required this.appRepository});

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}

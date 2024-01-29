import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl({required this.languageLocalDataSource});

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.dataBase));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String languageCode) async {
    try {
      final response =
          await languageLocalDataSource.updateLanguage(languageCode);
      return Right(response);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.dataBase));
    }
  }
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';

class MovieRepositoryImplement extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImplement({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }
}

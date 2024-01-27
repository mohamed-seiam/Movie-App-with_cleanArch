import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
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

  @override
  Future<Either<AppError, MovieDetailsEntity>> getMovieDetails(int id) async {
    try {
      final movieDetails = await remoteDataSource.getMovieDetails(id);
      return Right(movieDetails);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(
      String searchQuery) async {
    try {
      final searchedMovies =
          await remoteDataSource.getSearchedMovie(searchQuery);
      return Right(searchedMovies);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }
}

part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsError extends MovieDetailsState {
  final AppErrorType appErrorType;

 const MovieDetailsError({required this.appErrorType});
  @override
  List<Object?> get props => [appErrorType];
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetailsEntity;

  const MovieDetailsSuccess({required this.movieDetailsEntity});

  @override
  List<Object?> get props => [movieDetailsEntity];
}

part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();
}

class MovieCarouselInitial extends MovieCarouselState {
  @override
  List<Object> get props => [];
}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType appErrorType;

 const MovieCarouselError({required this.appErrorType});
  @override
  List<Object?> get props => [];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, this.defaultIndex = 0});

  @override
  List<Object?> get props => [movies, defaultIndex];
}
class MovieCarouselLanguageChanged extends MovieCarouselState {
  @override
  List<Object?> get props => [];
}
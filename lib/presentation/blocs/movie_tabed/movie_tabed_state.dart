part of 'movie_tabed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentIndex;

  const MovieTabbedState({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  @override
  List<Object> get props => [];
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({super.currentIndex, required this.movies});

  @override
  List<Object> get props => [currentIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  const MovieTabLoadError({super.currentIndex});
}

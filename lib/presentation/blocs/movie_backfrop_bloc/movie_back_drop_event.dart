part of 'movie_back_drop_bloc.dart';

abstract class MovieBackDropEvent extends Equatable {
  const MovieBackDropEvent();
}

class MovieBackDropChangeEvent extends MovieBackDropEvent {
  final MovieEntity movieEntity;

  const MovieBackDropChangeEvent({required this.movieEntity});

  @override
  List<Object?> get props => [movieEntity];
}

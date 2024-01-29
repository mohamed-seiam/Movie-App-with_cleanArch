part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();
}

class LoadFavoriteMovieEvent extends FavoriteMoviesEvent {
  @override
  List<Object?> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoriteMoviesEvent {
  final int movieId;

  const DeleteFavoriteMovieEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteMoviesEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  const ToggleFavoriteMovieEvent(
      {required this.movieEntity, required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite, movieEntity];
}

class CheckIfFavoriteMovieEvent extends FavoriteMoviesEvent {
  final int movieId;

  const CheckIfFavoriteMovieEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

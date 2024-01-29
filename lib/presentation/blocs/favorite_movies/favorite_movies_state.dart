part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesState extends Equatable {
  const FavoriteMoviesState();
}

class FavoriteMoviesInitial extends FavoriteMoviesState {
  @override
  List<Object> get props => [];
}

class FavoritesMoviesLoaded extends FavoriteMoviesState {
  final List<MovieEntity> movies;

  const FavoritesMoviesLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class FavoriteMoviesError extends FavoriteMoviesState {
  final AppErrorType appErrorType;

  const FavoriteMoviesError(this.appErrorType);

  @override
  List<Object?> get props => [appErrorType];
}

class IsFavoriteMovie extends FavoriteMoviesState {
  final bool isFavorite;

  const IsFavoriteMovie({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}
class ChangeIconFavorite extends FavoriteMoviesState {
  @override
  List<Object?> get props =>[];
}
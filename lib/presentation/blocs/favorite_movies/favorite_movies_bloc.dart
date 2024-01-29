import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/check_favorite_movie.dart';
import '../../../domain/usecases/delete_favorite_movie.dart';
import '../../../domain/usecases/get_favorite_movies.dart';
import '../../../domain/usecases/save_movie.dart';

part 'favorite_movies_event.dart';

part 'favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteMoviesBloc(this.saveMovie, this.getFavoriteMovies,
      this.deleteFavoriteMovie, this.checkIfFavoriteMovie)
      : super(FavoriteMoviesInitial()) {
    on<FavoriteMoviesEvent>(
      (event, emit) async {
        if (event is ToggleFavoriteMovieEvent) {
          if (event.isFavorite) {
            await deleteFavoriteMovie(MovieParams(id: event.movieEntity.id));
            add(CheckIfFavoriteMovieEvent(movieId: event.movieEntity.id));
          } else {
            await saveMovie(event.movieEntity);
            add(CheckIfFavoriteMovieEvent(movieId: event.movieEntity.id));
          }
          final response =
              await checkIfFavoriteMovie(MovieParams(id: event.movieEntity.id));
          emit(response.fold(
            (l) => FavoriteMoviesError(l.appErrorType),
            (r) => IsFavoriteMovie(isFavorite: event.isFavorite),
          ));
        } else if (event is LoadFavoriteMovieEvent) {
          await _fetchFavoriteMovies(emit);
        } else if (event is DeleteFavoriteMovieEvent) {
          await deleteFavoriteMovie(MovieParams(id: event.movieId));
          await _fetchFavoriteMovies(emit);
        } else if (event is CheckIfFavoriteMovieEvent) {
          final response =
              await checkIfFavoriteMovie(MovieParams(id: event.movieId));
          response.fold(
            (l) => emit(
              FavoriteMoviesError(l.appErrorType),
            ),
            (r) => emit(IsFavoriteMovie(isFavorite: r)),
          );
        }
      },
    );
  }

  Future<void> _fetchFavoriteMovies(Emitter<FavoriteMoviesState> emit) async {
    final eitherResponse = await getFavoriteMovies(NoParams());
    eitherResponse.fold(
      (l) => emit(FavoriteMoviesError(l.appErrorType)),
      (movies) => emit(FavoritesMoviesLoaded(movies: movies)),
    );
  }
}

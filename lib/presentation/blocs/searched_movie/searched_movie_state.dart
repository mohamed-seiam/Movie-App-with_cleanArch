part of 'searched_movie_bloc.dart';

abstract class SearchedMovieState extends Equatable {
  const SearchedMovieState();
}

class SearchedMovieInitial extends SearchedMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieLoaded extends SearchedMovieState {
  final List<MovieEntity> movies;

  const SearchMovieLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class SearchMovieLoading extends SearchedMovieState {
  @override
  List<Object?> get props => [];
}

class SearchMovieError extends SearchedMovieState {
   final AppErrorType error;

 const SearchMovieError({required this.error});
  @override
  List<Object?> get props =>[error];

}

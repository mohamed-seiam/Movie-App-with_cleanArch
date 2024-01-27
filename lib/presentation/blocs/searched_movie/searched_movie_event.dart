part of 'searched_movie_bloc.dart';

abstract class SearchedMovieEvent extends Equatable {
  const SearchedMovieEvent();
}

class SearchedQueryChangedEvent extends SearchedMovieEvent {
  final String searchQuery;

  const SearchedQueryChangedEvent({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

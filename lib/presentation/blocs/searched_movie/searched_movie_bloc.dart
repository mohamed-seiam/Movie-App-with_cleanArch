import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_search_params.dart';
import 'package:movies_app/domain/usecases/get_searched_movie.dart';

import '../../../domain/entities/movie_entity.dart';
import '../loading/loading_bloc.dart';

part 'searched_movie_event.dart';

part 'searched_movie_state.dart';

class SearchedMovieBloc extends Bloc<SearchedMovieEvent, SearchedMovieState> {
  final GetSearchedMovie searchedMovie;
  final LoadingBloc loadingBloc;

  SearchedMovieBloc(this.searchedMovie, this.loadingBloc)
      : super(SearchedMovieInitial()) {
    on<SearchedMovieEvent>(
      (event, emit) async {
        if (event is SearchedQueryChangedEvent) {
          loadingBloc.add(StartLoading());
          if (event.searchQuery.length > 2) {
            emit(SearchMovieLoading());
            final eitherResponse = await searchedMovie(
              MovieSearchParams(searchQuery: event.searchQuery),
            );
            eitherResponse.fold(
              (error) => emit(
                SearchMovieError(error: error.appErrorType),
              ),
              (movies) => emit(
                SearchMovieLoaded(movies: movies),
              ),
            );
          }
          loadingBloc.add(FinishLoading());
        }
      },
    );
  }
}

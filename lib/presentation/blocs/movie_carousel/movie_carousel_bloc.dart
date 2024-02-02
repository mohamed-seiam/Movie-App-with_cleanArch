import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending.dart';
import '../loading/loading_bloc.dart';
import '../movie_backfrop_bloc/movie_back_drop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackDropBloc movieBackDropBloc;
  final LoadingBloc loadingBloc;

  MovieCarouselBloc(
    this.loadingBloc, {
    required this.getTrending,
    required this.movieBackDropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(
      (event, emit) async {
          loadingBloc.add(StartLoading());
          final movieEither = await getTrending(event.pageNumber);
          emit(
            movieEither.fold(
              (l) {
                print(l.toString());
                return MovieCarouselError(appErrorType: l.appErrorType);
              },
              (movies) {
                movieBackDropBloc.add(
                  MovieBackDropChangeEvent(
                    movieEntity: movies[event.defaultIndex],
                  ),
                );
                return MovieCarouselLoaded(
                  movies: movies,
                  defaultIndex: event.defaultIndex,
                );
              },
            ),
          );
          loadingBloc.add(FinishLoading());

      },
    );
  }
}

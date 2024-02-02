import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_coming_soon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabed_event.dart';

part 'movie_tabed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetComingSoon getComingSoon;
  final GetPlayingNow getPlayingNow;

  MovieTabbedBloc(this.getPopular, this.getComingSoon, this.getPlayingNow)
      : super(MovieTabbedInitial()) {
    on<MovieTabbedEvent>((event, emit) async {
      if (event is MovieTabbedChangedEvent) {
        emit(MovieTabbedLoading(currentTabIndex: event.currentTabIndex));
        late Either<AppError, List<MovieEntity>> movieEither;
        switch (event.currentTabIndex) {
          case 0:
            movieEither = await getPopular(event.currentPage);
            break;
          case 1:
            movieEither = await getPlayingNow(event.currentPage);
            break;
          case 2:
            movieEither = await getComingSoon(event.currentPage);
            break;
        }

        movieEither.fold(
          (l) => MovieTabLoadError(
              currentIndex: event.currentTabIndex, l.appErrorType),
          (movies) => emit(MovieTabChanged(
              movies: movies, currentIndex: event.currentTabIndex)),
        );
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending.dart';
import '../movie_backfrop_bloc/movie_back_drop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackDropBloc movieBackDropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackDropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      final movieEither = await getTrending(NoParams());
      emit(movieEither.fold((l) => MovieCarouselError(), (movies) {
        movieBackDropBloc.add(
            MovieBackDropChangeEvent(movieEntity: movies[event.defaultIndex]));
        return MovieCarouselLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        );
      }));
    });
  }
}

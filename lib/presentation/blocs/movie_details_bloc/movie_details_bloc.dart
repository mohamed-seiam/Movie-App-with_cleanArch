import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_movie_details.dart';
import '../cast/cast_crew_bloc.dart';
import '../videos/videos_bloc.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final CastCrewBloc getCastBloc;
  final VideosBloc videosBloc;

  MovieDetailsBloc(this.getMovieDetails, this.getCastBloc, this.videosBloc)
      : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>(
      (event, emit) async {
        if (event is MovieDetailLoadEvent) {
          final eitherResponse = await getMovieDetails(
            MovieParams(id: event.movieId),
          );
          emit(
            eitherResponse.fold(
              (l) => MovieDetailsError(appErrorType: l.appErrorType),
              (movieDetails) =>
                  MovieDetailsSuccess(movieDetailsEntity: movieDetails),
            ),
          );
          getCastBloc.add(
            LoadCastEvent(movieId: event.movieId),
          );
          videosBloc.add(LoadVideosEvent(movieId: event.movieId));
        }
      },
    );
  }
}

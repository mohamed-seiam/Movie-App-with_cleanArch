import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

import '../../../domain/usecases/get_coming_soon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';
import '../../../domain/usecases/get_trending.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  final GetPopular getPopular;
  final GetComingSoon getComingSoon;
  final GetPlayingNow getPlayingNow;
  final GetTrending getTrending;

  SectionsCubit(
      this.getPopular, this.getComingSoon, this.getPlayingNow, this.getTrending)
      : super(SectionsInitial());

  Future<void> getSectionMovies(
      {int currentPage = 1, required int index}) async {
    if (currentPage == 1) {
      emit(SectionLoading());
    } else {
      emit(SectionLoadingFromPagination());
    }
    late Either<AppError, List<MovieEntity>> movieEither;
    switch (index) {
      case 0:
        movieEither = await getTrending.call(currentPage);
      case 1:
        movieEither = await getPopular.call(currentPage);
      case 2:
        movieEither = await getPlayingNow.call(currentPage);
      case 3:
        movieEither = await getComingSoon.call(currentPage);
    }
    movieEither.fold(
      (failure) {
        if (currentPage == 1) {
          emit(SectionFailure(appErrorType: failure.appErrorType));
        } else {
          emit(SectionLoadingFromPagination());
        }
      },
      (movies) {
        emit(SectionSuccess(movies: movies));
      },
    );
  }
}

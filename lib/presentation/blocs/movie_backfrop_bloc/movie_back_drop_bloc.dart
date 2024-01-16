import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

part 'movie_back_drop_event.dart';

part 'movie_back_drop_state.dart';

class MovieBackDropBloc extends Bloc<MovieBackDropEvent, MovieBackDropState> {
  MovieBackDropBloc() : super(MovieBackDropInitial()) {
    on<MovieBackDropEvent>((event, emit) {
      if (event is MovieBackDropChangeEvent) {
        emit(MovieBackdropCHanged(movieEntity: event.movieEntity));
      }
    });
  }
}


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';

import '../../../domain/entities/cast_entity.dart';
import '../../../domain/usecases/get_cast.dart';

part 'cast_crew_event.dart';

part 'cast_crew_state.dart';

class CastCrewBloc extends Bloc<CastCrewEvent, CastCrewState> {
  final GetCast getCast;
  CastCrewBloc(this.getCast) : super(CastCrewInitial()) {
    on<CastCrewEvent>((event, emit) async {
      if (event is LoadCastEvent) {
        final eitherResponse = await getCast(MovieParams(id: event.movieId));
        emit(
          eitherResponse.fold(
            (error) => CastError(typeError: error.appErrorType),
            (casts) => CastLoaded(casts: casts),
          ),
        );
      }
    });
  }
}

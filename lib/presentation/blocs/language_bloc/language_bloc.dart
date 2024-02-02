import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constance/language.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/labguage_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';

import '../../../domain/usecases/get_preferred_language.dart';
import '../../../domain/usecases/update_language.dart';
import '../movie_carousel/movie_carousel_bloc.dart';
import '../movie_tabed/movie_tabed_bloc.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;
  final MovieTabbedBloc movieTabbedBloc;
  final MovieCarouselBloc moveCarouselBloc;

  LanguageBloc(this.getPreferredLanguage, this.updateLanguage,
      this.movieTabbedBloc, this.moveCarouselBloc)
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<LanguageEvent>((event, emit) async {
      if (event is ToggleLanguageEvent) {
        await updateLanguage(event.languageEntity.code);
        add(LoadPreferredLanguageEvent());
      } else if (event is LoadPreferredLanguageEvent) {
        final response = await getPreferredLanguage(NoParams());
        response.fold(
          (error) => emit(LanguageError(appErrorType: error.appErrorType)),
          (languageCode) {
            emit(LanguageLoaded(locale: Locale(languageCode)));
          },
        );
      }
    });
  }
}

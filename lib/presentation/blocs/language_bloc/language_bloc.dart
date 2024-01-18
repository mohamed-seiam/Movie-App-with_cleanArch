
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constance/language.dart';
import 'package:movies_app/domain/entities/labguage_entity.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<LanguageEvent>((event, emit) {
      if (event is ToggleLanguageEvent) {
        emit(
          LanguageLoaded(
            locale: Locale(event.languageEntity.code),
          ),
        );
      }
    });
  }
}

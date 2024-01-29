part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity languageEntity;

  const ToggleLanguageEvent({required this.languageEntity});

  @override
  List<Object?> get props => [languageEntity.code];
}

class LoadPreferredLanguageEvent extends LanguageEvent {
  @override
  List<Object?> get props => [];
}

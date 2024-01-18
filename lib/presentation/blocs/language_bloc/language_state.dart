part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded({required this.locale});
  @override
  // TODO: implement props
  List<Object?> get props => [locale.languageCode];
}
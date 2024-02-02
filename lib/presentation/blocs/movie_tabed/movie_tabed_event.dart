part of 'movie_tabed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabbedChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;
final int currentPage;
  const MovieTabbedChangedEvent({this.currentTabIndex = 0,this.currentPage=1});

  @override
  List<Object?> get props => [currentTabIndex];

}
class LanguageMovieTabbedChangedEvent extends MovieTabbedEvent {
  @override
  List<Object?> get props => [];
}

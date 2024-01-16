part of 'movie_tabed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabbedChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTabbedChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object?> get props => [currentTabIndex];
}

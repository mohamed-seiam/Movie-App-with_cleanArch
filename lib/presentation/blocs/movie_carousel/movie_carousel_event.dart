part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;
  final int pageNumber;

  const CarouselLoadEvent({this.defaultIndex = 0, this.pageNumber = 1});

  @override
  List<Object?> get props => [defaultIndex];
}

class CarouselLanguageChangedEvent extends MovieCarouselEvent {
  @override
  List<Object?> get props => [];
}

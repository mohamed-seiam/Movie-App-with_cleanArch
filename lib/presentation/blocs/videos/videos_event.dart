part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();
}
class LoadVideosEvent extends VideosEvent {
  final int movieId;

 const LoadVideosEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];

}
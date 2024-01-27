part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
}

class VideosInitial extends VideosState {
  @override
  List<Object> get props => [];
}

class NoVideos extends VideosState {
  @override
  List<Object?> get props => [];
}

class LoadedVideos extends VideosState {
  final List<VideoEntity> videos;

  const LoadedVideos({required this.videos});

  @override
  List<Object?> get props => [videos];
}


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/video_entity.dart';
import '../../../domain/repositories/movie_repo.dart';

part 'videos_event.dart';

part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final MovieRepository repository;

  VideosBloc(this.repository) : super(VideosInitial()) {
    on<VideosEvent>((event, emit) async {
      if (event is LoadVideosEvent) {
        final eitherResponse = await repository.getVideos(event.movieId);
        eitherResponse.fold(
          (noVideo) => emit(NoVideos()),
          (videos) => emit(
            LoadedVideos(videos: videos),
          ),
        );
      }
    });
  }
}

import '../../../domain/entities/video_entity.dart';

class WatchVideoArguments {
  final List<VideoEntity> videos;

  WatchVideoArguments({required this.videos});
}
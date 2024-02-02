import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movies_app/presentation/screens/watch_video/watch_video_arguments.dart';
import '../../../widgets/button.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({super.key, required this.videosBloc});

  final VideosBloc videosBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is LoadedVideos && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return AppButton(
            isEnabled: true,
            text: TranslationConstance.watchTrailers,
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutesList.watchTrailer,
                arguments: WatchVideoArguments(videos: _videos),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

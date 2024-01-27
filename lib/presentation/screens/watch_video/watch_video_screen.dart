import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/presentation/screens/watch_video/watch_video_arguments.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  const WatchVideoScreen({super.key, required this.watchVideoArguments});

  final WatchVideoArguments watchVideoArguments;

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.vulcan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          TranslationConstance.watchTrailers.t(context),
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 1; i < _videos.length; i++)
                        Container(
                          height: 100.h,
                          padding:
                              EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: Sizes.dimen_200.w,
                                  fit: BoxFit.fitHeight,
                                  errorWidget: (context,url,error){
                                    return const Icon(Icons.error,color: Colors.white,);
                                  },
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key,
                                    quality: ThumbnailQuality.max,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    _videos[i].title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/widgets/movie_app_bar.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../widgets/seperator_widget.dart';
import 'movie_back_drop_widget.dart';
import 'movie_data.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  const MovieCarouselWidget(
      {super.key, required this.movies, required this.defaultIndex});

  final List<MovieEntity> movies;
  final int defaultIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackDropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            const MovieDataWidget(),
            SizedBox(height: 3.h,),
            const SeparatorWidget(),
          ],
        ),
      ],
    );
  }
}

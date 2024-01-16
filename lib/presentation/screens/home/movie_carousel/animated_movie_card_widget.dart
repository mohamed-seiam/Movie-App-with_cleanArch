import 'package:flutter/material.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  const AnimatedMovieCardWidget(
      {super.key,
      required this.index,
      required this.movieId,
      required this.posterPath,
      required this.pageController});

  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(value) *
                  MediaQuery.sizeOf(context).height *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(index == 0 ? value: value * 0.5) *
                  MediaQuery.sizeOf(context).height *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}

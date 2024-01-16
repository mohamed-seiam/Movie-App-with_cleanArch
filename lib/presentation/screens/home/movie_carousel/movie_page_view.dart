import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/presentation/blocs/movie_backfrop_bloc/movie_back_drop_bloc.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  const MoviePageView(
      {super.key, required this.movies, required this.initialPage});

  final List<MovieEntity> movies;
  final int initialPage;

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movieEntity.id,
            posterPath: movieEntity.posterPath,
          );
        },
        pageSnapping: true,
        onPageChanged: (index) {
          print('changed');
          context
              .read<MovieBackDropBloc>()
              .add(MovieBackDropChangeEvent(movieEntity: widget.movies[index]));
        },
        itemCount: widget.movies.length ?? 0,
      ),
    );
  }
}

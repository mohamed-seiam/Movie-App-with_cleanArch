import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/movie_tab_card_widget.dart';

import '../../../domain/entities/movie_entity.dart';

class MovieListViewBuilder extends StatelessWidget {
  const MovieListViewBuilder({super.key, required this.movies});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movieEntity = movies[index];
            return MovieTabCardWidget(
              movieId: movieEntity.id,
              title: movieEntity.title,
              posterPath: movieEntity.posterPath,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 14.w,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: movies.length),
    );
  }
}

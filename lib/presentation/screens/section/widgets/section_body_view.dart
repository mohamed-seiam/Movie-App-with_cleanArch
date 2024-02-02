import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/presentation/blocs/section/sections_cubit.dart';
import 'package:movies_app/presentation/screens/home/movie_carousel/movie_carousel_error_widget.dart';
import 'package:movies_app/presentation/screens/loading/loading_circle.dart';
import 'package:movies_app/presentation/screens/section/widgets/section_grid_view.dart';

import '../../../../domain/entities/movie_entity.dart';

class SectionBodyView extends StatefulWidget {
  const SectionBodyView({super.key, required this.index});

  final int index;

  @override
  State<SectionBodyView> createState() => _SectionBodyViewState();
}

class _SectionBodyViewState extends State<SectionBodyView> {
  List<MovieEntity> movies = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionsCubit, SectionsState>(
      builder: (context, state) {
        if (state is SectionSuccess ||
            state is SectionLoadingFromPagination ||
            state is SectionFailureFromPagination) {
          return SectionGridView(
            movies: movies,
            index: widget.index,
          );
        } else if (state is SectionFailure) {
          return Center(
            child: AppErrorWidget(
              errorType: state.appErrorType,
              onPressed: () {},
            ),
          );
        } else {
          return Center(
            child: LoadingCircle(size: Sizes.dimen_200.w),
          );
        }
      },
      listener: (context, state) {
        if (state is SectionSuccess) {
          movies.addAll(state.movies);
        }
      },
    );
  }
}

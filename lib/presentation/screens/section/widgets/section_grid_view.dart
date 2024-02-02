import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/blocs/section/sections_cubit.dart';
import 'package:movies_app/presentation/screens/section/widgets/section_card_item.dart';

import '../../../../common/constance/size_constance.dart';
import '../../../../domain/entities/movie_entity.dart';

class SectionGridView extends StatefulWidget {
  const SectionGridView({
    super.key,
    required this.movies,
    required this.index,
  });

  final List<MovieEntity> movies;
  final int index;

  @override
  State<SectionGridView> createState() => _SectionGridViewState();
}

class _SectionGridViewState extends State<SectionGridView> {
  final ScrollController _scrollController = ScrollController();
  var nexPage = 2;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLenght = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLenght) {
      if (!isLoading) {
        isLoading = false;
       await BlocProvider.of<SectionsCubit>(context)
            .getSectionMovies(index: widget.index, currentPage: nexPage++);
        isLoading = true;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.dimen_10.w,
        mainAxisSpacing: Sizes.dimen_10.h,
        childAspectRatio: .8,
      ),
      itemBuilder: (context, index) {
        final movieEntity = widget.movies[index];
        return SectionCardItem(
          movieId: movieEntity.id,
          title: movieEntity.title,
          posterPath: movieEntity.posterPath,
        );
      },
    );
  }
}

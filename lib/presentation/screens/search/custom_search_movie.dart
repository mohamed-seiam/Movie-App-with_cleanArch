import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/blocs/searched_movie/searched_movie_bloc.dart';
import 'package:movies_app/presentation/screens/home/movie_carousel/movie_carousel_error_widget.dart';
import 'package:movies_app/presentation/screens/search/search_movie_card.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchedMovieBloc searchedMovieBloc;

  CustomSearchDelegate(this.searchedMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.greySubTitle,
        ),
        colorScheme: const ColorScheme.dark(
            background: Colors.transparent,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColors.royalBlue,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchedMovieBloc.add(SearchedQueryChangedEvent(searchQuery: query));
    return BlocBuilder<SearchedMovieBloc, SearchedMovieState>(
      bloc: searchedMovieBloc,
        builder: (context, state) {
          if (state is SearchMovieError) {
            return AppErrorWidget(
              errorType: state.error,
              onPressed: () {
                searchedMovieBloc
                    .add(SearchedQueryChangedEvent(searchQuery: query));
              },
            );
          } else if (state is SearchMovieLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                  child: Text(TranslationConstance.noMoviesSearched.t(context)),
                ),
              );
            }
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchMovieCard(
                movie: movies[index],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';
import 'package:movies_app/presentation/screens/home/movie_carousel/movie_carousel_error_widget.dart';
import 'package:movies_app/presentation/screens/loading/loading_circle.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/movie_list_view_builder.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/movie_tabbe_constance.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/tab_title_widget.dart';

import '../../../common/constance/translation_constance.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc => context.read<MovieTabbedBloc>();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabbedChangedEvent(currentTabIndex: currentIndex,currentPage: 1));
  }

  @override
  void dispose() {
    movieTabbedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieTabbedBloc, MovieTabbedState>(
      listener: (context,state){
        if (state is MovieTabbedLanguageChanged) {
          movieTabbedBloc.add(MovieTabbedChangedEvent(currentTabIndex: currentIndex,currentPage: 1));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () {
                        _onTabbed(i);
                      },
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentIndex,
                    ),
                ],
              ),
              if (state is MovieTabChanged)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                        child: Text(
                          TranslationConstance.noMovies.t(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ))
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                      errorType: state.apiErrorType,
                      onPressed: () {
                        movieTabbedBloc.add(MovieTabbedChangedEvent(
                            currentTabIndex: currentIndex));
                      }),
                ),
              if (state is MovieTabbedLoading)
                Expanded(child:Center(child: LoadingCircle(size: Sizes.dimen_100.w),)),
            ],
          ),
        );
      },
    );
  }

  void _onTabbed(int index) {
    print('tabbed now');
    movieTabbedBloc.add(MovieTabbedChangedEvent(currentTabIndex: index));
  }
}

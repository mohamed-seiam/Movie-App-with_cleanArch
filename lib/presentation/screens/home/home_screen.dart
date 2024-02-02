import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_backfrop_bloc/movie_back_drop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';
import 'package:movies_app/presentation/blocs/searched_movie/searched_movie_bloc.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/movie_tabed_widget.dart';

import '../drawer/navigation_drawer.dart';
import 'movie_carousel/movie_carousel_error_widget.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackDropBloc movieBackDropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  late SearchedMovieBloc searchedMovieBloc;

  @override
  void initState() {
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackDropBloc = movieCarouselBloc.movieBackDropBloc;
    searchedMovieBloc = getItInstance.get<SearchedMovieBloc>();
    movieCarouselBloc.add(const CarouselLoadEvent(pageNumber: 1));
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieTabbedBloc.close();
    movieBackDropBloc.close();
    searchedMovieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackDropBloc,
        ),
        BlocProvider(
          create: (context) => movieTabbedBloc,
        ),
        BlocProvider(
          create: (context) => searchedMovieBloc,
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        body: BlocConsumer<MovieCarouselBloc, MovieCarouselState>(
          listener: (context, state) {
            if (state is MovieCarouselLanguageChanged) {
              movieCarouselBloc.add(const CarouselLoadEvent(pageNumber: 1));
            }
          },
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                errorType: state.appErrorType,
                onPressed: () {
                  movieCarouselBloc.add(const CarouselLoadEvent());
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

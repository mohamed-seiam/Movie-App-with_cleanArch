import 'package:flutter/material.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:movies_app/presentation/screens/home/home_screen.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_screen.dart';
import 'package:movies_app/presentation/screens/section/section_screen.dart';
import 'package:movies_app/presentation/screens/section/section_screen_arguments.dart';
import 'package:movies_app/presentation/screens/watch_video/watch_video_arguments.dart';
import 'package:movies_app/presentation/screens/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RoutesList.initial: (context) => const HomeScreen(),
        RoutesList.movieDetail: (context) => MovieDetailsScreen(
            movieDetailsArguments: settings.arguments as MovieDetailsArguments),
        RoutesList.watchTrailer: (context) => WatchVideoScreen(
            watchVideoArguments: settings.arguments as WatchVideoArguments),
        RoutesList.favorite: (context) => const FavoriteScreen(),
        RoutesList.section: (context) => SectionsScreen(
            moviesArguments: settings.arguments as SectionMoviesArguments),
      };
}

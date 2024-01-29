import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';

import 'widgets/favorite_movies_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteMoviesBloc _favoriteMoviesBloc;

  @override
  void initState() {
    _favoriteMoviesBloc = getItInstance<FavoriteMoviesBloc>();
    _favoriteMoviesBloc.add(LoadFavoriteMovieEvent());
    super.initState();
  }

  @override
  void dispose() {
    _favoriteMoviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TranslationConstance.favoriteMovies.t(context)),
      ),
      body: BlocProvider.value(
        value: _favoriteMoviesBloc,
        child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          builder: (context, state) {
            if (state is FavoritesMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstance.noFavoriteMovies.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }
              return FavoritesMoviesGridView(
                movies:state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

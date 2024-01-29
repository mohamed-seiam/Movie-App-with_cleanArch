import 'package:hive/hive.dart';
import 'package:movies_app/common/constance/app_string_constance.dart';
import 'package:movies_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);

  Future<List<MovieTable>> getFavoritesMovies();

  Future<void> deleteMovie(int movieId);

  Future<bool> checkIfMovieFavorite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox(AppStringConstance.kMovieBox);
    await movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getFavoritesMovies() async {
    final movieBox = await Hive.openBox(AppStringConstance.kMovieBox);
    final movieId = movieBox.keys;
    List<MovieTable> movies = [];
    movieId.forEach((element) {
      movies.add(movieBox.get(element));
    });
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox(AppStringConstance.kMovieBox);
    await movieBox.put(movieTable.id, movieTable);
  }
}

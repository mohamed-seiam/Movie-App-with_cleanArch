
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(path: 'trending/movie/day');
    final trendingMovies = MoviesResultModel.fromJson(response).movies;
    print(trendingMovies);
    return trendingMovies??[];
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(path: 'movie/popular');
    final popularMovies = MoviesResultModel.fromJson(response).movies;
    print(popularMovies);
    return popularMovies ?? [];
  }
}

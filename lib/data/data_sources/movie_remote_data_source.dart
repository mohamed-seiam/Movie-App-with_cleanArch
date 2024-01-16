
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
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

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get(path: 'movie/upcoming');
    final upComingMovies = MoviesResultModel.fromJson(response).movies;
    print(upComingMovies);
    return upComingMovies??[];
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get(path: 'movie/now_playing');
    final nowPlayingMovies = MoviesResultModel.fromJson(response).movies;
    print(nowPlayingMovies);
    return nowPlayingMovies??[];
    throw UnimplementedError();
  }
}

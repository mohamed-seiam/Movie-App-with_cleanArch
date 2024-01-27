import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/cast_crew_resault_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';
import 'package:movies_app/data/models/video_model.dart';
import 'package:movies_app/data/models/video_resault_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getPlayingNow();

  Future<List<MovieModel>> getComingSoon();

  Future<MovieDetailModel> getMovieDetails(int id);

  Future<List<CastModel>> getCastCrew(int id);

  Future<List<VideoModel>> getVideos(int id);

  Future<List<MovieModel>> getSearchedMovie(String searchQuery);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(path: 'trending/movie/day');
    final trendingMovies = MoviesResultModel.fromJson(response).movies;
    print(trendingMovies);
    return trendingMovies ?? [];
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
    return upComingMovies ?? [];
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get(path: 'movie/now_playing');
    final nowPlayingMovies = MoviesResultModel.fromJson(response).movies;
    print(nowPlayingMovies);
    return nowPlayingMovies ?? [];
  }

  @override
  Future<MovieDetailModel> getMovieDetails(int id) async {
    final response = await _client.get(path: 'movie/$id');
    final movieDetails = MovieDetailModel.fromJson(response);
    print(movieDetails);
    return movieDetails;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get(path: 'movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get(path: 'movie/$id/videos');
    final video = VideoResultModel.fromJson(response).videos;
    print(video);
    return video;
  }

  @override
  Future<List<MovieModel>> getSearchedMovie(String searchQuery) async {
    final response = await _client.get(path: 'search/movie', queryParams: {
      'query': searchQuery,
    });
    final searchedMovies = MoviesResultModel.fromJson(response).movies;
    return searchedMovies ?? [];
  }
}

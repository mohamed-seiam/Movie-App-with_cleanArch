import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/cast_crew_resault_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';
import 'package:movies_app/data/models/video_model.dart';
import 'package:movies_app/data/models/video_resault_model.dart';

import 'language_local_data_source.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending(int pageNumber);

  Future<List<MovieModel>> getPopular(int pageNumber);

  Future<List<MovieModel>> getPlayingNow(int pageNumber);

  Future<List<MovieModel>> getComingSoon(int pageNumber);

  Future<MovieDetailModel> getMovieDetails(int id);

  Future<List<CastModel>> getCastCrew(int id);

  Future<List<VideoModel>> getVideos(int id);

  Future<List<MovieModel>> getSearchedMovie(String searchQuery);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  final LanguageLocalDataSource languageLocalDataSource;

  MovieRemoteDataSourceImpl(this._client, this.languageLocalDataSource);

  @override
  Future<List<MovieModel>> getTrending(int pageNumber) async {
    String languageCode = await languageLocalDataSource.getPreferredLanguage();
    final response =
        await _client.get(path: 'trending/movie/day', queryParams: {
      'page': pageNumber,
      'language': languageCode,
    });
    final trendingMovies = MoviesResultModel.fromJson(response).movies;
    print(trendingMovies);
    return trendingMovies ?? [];
  }

  @override
  Future<List<MovieModel>> getPopular(int pageNumber) async {
    String languageCode = await languageLocalDataSource.getPreferredLanguage();

    final response = await _client.get(path: 'movie/popular', queryParams: {
      'page': pageNumber,
      'language': languageCode,
    });
    final popularMovies = MoviesResultModel.fromJson(response).movies;
    print(popularMovies);
    return popularMovies ?? [];
  }

  @override
  Future<List<MovieModel>> getComingSoon(int pageNumber) async {
    String languageCode = await languageLocalDataSource.getPreferredLanguage();

    final response = await _client.get(path: 'movie/upcoming', queryParams: {
      'page': pageNumber,
      'language': languageCode,
    });
    final upComingMovies = MoviesResultModel.fromJson(response).movies;
    print(upComingMovies);
    return upComingMovies ?? [];
  }

  @override
  Future<List<MovieModel>> getPlayingNow(int pageNumber) async {
    String languageCode = await languageLocalDataSource.getPreferredLanguage();
    final response = await _client.get(path: 'movie/now_playing', queryParams: {
      'page': pageNumber,
      'language': languageCode,
    });
    final nowPlayingMovies = MoviesResultModel.fromJson(response).movies;
    print(nowPlayingMovies);
    return nowPlayingMovies ?? [];
  }

  @override
  Future<MovieDetailModel> getMovieDetails(int id) async {
    String languageCode = await languageLocalDataSource.getPreferredLanguage();

    final response = await _client.get(path: 'movie/$id', queryParams: {
      'language': languageCode,
    });
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
    String languageCode = await languageLocalDataSource.getPreferredLanguage();

    final response = await _client.get(path: 'movie/$id/videos', queryParams: {
      'language': languageCode,
    });
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

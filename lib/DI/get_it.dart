import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/data/data_sources/movie_local_data_source.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/app_repository_imple.dart';
import 'package:movies_app/data/repositories/authentication_repository_impl.dart';
import 'package:movies_app/data/repositories/movie_repository_imple.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/repositories/movie_repo.dart';
import 'package:movies_app/domain/usecases/check_favorite_movie.dart';
import 'package:movies_app/domain/usecases/delete_favorite_movie.dart';
import 'package:movies_app/domain/usecases/get_cast.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_favorite_movies.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_preferred_language.dart';
import 'package:movies_app/domain/usecases/get_searched_movie.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/domain/usecases/get_videos.dart';
import 'package:movies_app/domain/usecases/save_movie.dart';
import 'package:movies_app/domain/usecases/update_language.dart';
import 'package:movies_app/presentation/blocs/cast/cast_crew_bloc.dart';
import 'package:movies_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backfrop_bloc/movie_back_drop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';
import 'package:movies_app/presentation/blocs/searched_movie/searched_movie_bloc.dart';
import 'package:movies_app/presentation/blocs/section/sections_cubit.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';

import '../data/data_sources/authentication_local_data_source.dart';
import '../data/data_sources/authentication_remote_data_source.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/usecases/login_user.dart';
import '../presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import '../presentation/blocs/login/login_bloc.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance.registerLazySingleton<MovieRepository>(() =>
      MovieRepositoryImplement(
          remoteDataSource: getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(getItInstance(),
          authenticationRemoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        languageLocalDataSource: getItInstance(),
      ));
  getItInstance.registerLazySingleton<GetTrending>(
      () => GetTrending(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(appRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(appRepository: getItInstance()));
  getItInstance.registerLazySingleton<SaveMovie>(
      () => SaveMovie(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(client: getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  getItInstance.registerSingleton<LoadingBloc>(LoadingBloc());
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(getItInstance()));
  getItInstance.registerLazySingleton<LoginUser>(
      () => LoginUser(authenticationRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(
      () => GetPopular(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetVideos>(
      () => GetVideos(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(
      () => GetCast(movieRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetSearchedMovie>(
      () => GetSearchedMovie(movieRepository: getItInstance()));
  getItInstance.registerFactory(() => MovieCarouselBloc(
        getItInstance(),
        getTrending: getItInstance(),
        movieBackDropBloc: getItInstance(),
      ));
  getItInstance.registerFactory(() => MovieBackDropBloc());
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getItInstance(),
      getItInstance(),
      getItInstance(),
    ),
  );
  getItInstance.registerSingleton<LanguageBloc>(
    LanguageBloc(getItInstance(), getItInstance(),getItInstance(),getItInstance()),
  );
  getItInstance.registerLazySingleton<GetMovieDetails>(
    () => GetMovieDetails(
      movieRepository: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => MovieDetailsBloc(getItInstance(), getItInstance(), getItInstance(),
        getItInstance(), getItInstance()),
  );
  getItInstance.registerFactory(
    () => CastCrewBloc(
      getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => SearchedMovieBloc(
      getItInstance(),
      getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => SectionsCubit(
      getItInstance(),
      getItInstance(),
      getItInstance(),
      getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => FavoriteMoviesBloc(
      getItInstance(),
      getItInstance(),
      getItInstance(),
      getItInstance(),
    ),
  );
  getItInstance.registerFactory(() => LoginBloc(
        getItInstance(),
      ));
  getItInstance.registerFactory(
    () => VideosBloc(
      getItInstance(),
    ),
  );
}

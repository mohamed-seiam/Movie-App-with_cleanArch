import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/presentation/blocs/cast/cast_crew_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movies_app/presentation/screens/home/movie_carousel/movie_carousel_error_widget.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/screens/movie_details/widgets/movie_details_body.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieDetailsArguments});

  final MovieDetailsArguments movieDetailsArguments;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsBloc _movieDetailsBloc;
  late CastCrewBloc _castCrewBloc;
  late VideosBloc _videosBloc;

  @override
  void initState() {
    _movieDetailsBloc = getItInstance<MovieDetailsBloc>();
    _castCrewBloc = _movieDetailsBloc.getCastBloc;
    _videosBloc = _movieDetailsBloc.videosBloc;
    _movieDetailsBloc.add(
        MovieDetailLoadEvent(movieId: widget.movieDetailsArguments.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailsBloc.close();
    _castCrewBloc.close();
    _videosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailsBloc),
          BlocProvider.value(value: _castCrewBloc),
          BlocProvider.value(value: _videosBloc),
        ],
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              final movieDetailsEntity = state.movieDetailsEntity;
              return SingleChildScrollView(
                child: MovieDetailsBody(
                  movieDetails: movieDetailsEntity,
                  videosBloc: _videosBloc,
                ),
              );
            } else if (state is MovieDetailsError) {
              return AppErrorWidget(
                errorType: state.appErrorType,
                onPressed: () {},
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

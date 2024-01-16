import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backfrop_bloc/movie_back_drop_bloc.dart';

class MovieDataWidget extends StatelessWidget {
  const MovieDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackDropBloc, MovieBackDropState>(
      builder: (context, state) {
        if (state is MovieBackdropCHanged) {
          return Text(
            state.movieEntity.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

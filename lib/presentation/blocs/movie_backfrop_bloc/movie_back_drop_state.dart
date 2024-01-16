part of 'movie_back_drop_bloc.dart';

abstract class MovieBackDropState extends Equatable {
  const MovieBackDropState();
}

class MovieBackDropInitial extends MovieBackDropState {
  @override
  List<Object> get props => [];
}

class MovieBackdropCHanged extends MovieBackDropState {
  final MovieEntity movieEntity;

 const MovieBackdropCHanged({required this.movieEntity});
  @override
  List<Object?> get props => [movieEntity];

}

import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final String title;
  final String overView;
  final String ? releaseDate;
  final String backDropPath;
  final int id;
  final String posterPath;
  final num ? voteAverage;

  const MovieDetailsEntity(
      {required this.title,
      required this.overView,
      required this.releaseDate,
      required this.backDropPath,
      required this.id,
      required this.posterPath,
      required this.voteAverage});

  @override
  List<Object?> get props => [id];
}

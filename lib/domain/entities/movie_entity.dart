import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backDropPath;
  final String  title;
  final num ? voteAverage;
  final String ? releaseDate;
  final String? overView;
  final String posterPath;

  const MovieEntity(
      {required this.id,
      required this.posterPath,
      required this.backDropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      this.overView});

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}

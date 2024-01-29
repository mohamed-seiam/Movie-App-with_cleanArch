import 'package:hive/hive.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;

  const MovieTable(
      {required this.id, required this.posterPath, required this.title})
      : super(
          title: title,
          posterPath: posterPath,
          id: id,
          voteAverage: 0,
          releaseDate: '',
          backDropPath: '',
          overView: '',
        );
  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
    );
  }
}

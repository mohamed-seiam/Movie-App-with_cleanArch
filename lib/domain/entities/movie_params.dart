import 'package:equatable/equatable.dart';

class MovieParams extends Equatable {
  final int id;

  const MovieParams({required this.id});

  @override
  List<Object?> get props => [id];
}

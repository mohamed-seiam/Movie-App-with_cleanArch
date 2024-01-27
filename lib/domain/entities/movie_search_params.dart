import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable {
  final String searchQuery;

 const MovieSearchParams({required this.searchQuery});
  @override
  List<Object?> get props => [searchQuery];

}
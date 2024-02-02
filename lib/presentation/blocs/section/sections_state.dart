part of 'sections_cubit.dart';

abstract class SectionsState extends Equatable {
  const SectionsState();
}

class SectionsInitial extends SectionsState {
  @override
  List<Object> get props => [];
}

class SectionLoading extends SectionsState {
  @override
  List<Object?> get props => [];
}

class SectionSuccess extends SectionsState {
  final List<MovieEntity> movies;

 const SectionSuccess({required this.movies});
  @override
  List<Object?> get props => [movies];
}
class SectionLoadingFromPagination extends SectionsState {
  @override
  List<Object?> get props => [];
}

class SectionFailureFromPagination extends SectionsState {
  @override
  List<Object?> get props => [];
}
class SectionFailure extends SectionsState {
  final AppErrorType appErrorType;

 const SectionFailure({required this.appErrorType});
  @override
  List<Object?> get props => [appErrorType];
}

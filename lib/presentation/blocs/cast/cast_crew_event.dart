part of 'cast_crew_bloc.dart';

abstract class CastCrewEvent extends Equatable {
  const CastCrewEvent();
}
class LoadCastEvent extends CastCrewEvent {
  final int movieId;

 const LoadCastEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
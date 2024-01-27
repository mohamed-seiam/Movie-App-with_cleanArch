part of 'cast_crew_bloc.dart';

abstract class CastCrewState extends Equatable {
  const CastCrewState();
}

class CastCrewInitial extends CastCrewState {
  @override
  List<Object> get props => [];
}

class CastLoaded extends CastCrewState {
  final List<CastEntity> casts;

 const CastLoaded({required this.casts});

  @override
  List<Object?> get props => [casts];
}

class CastError extends CastCrewState{
  final AppErrorType typeError;

 const CastError({required this.typeError});
  @override
  List<Object?> get props => [typeError];

}

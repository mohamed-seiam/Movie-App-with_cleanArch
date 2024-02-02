part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();
}
class StartLoading extends LoadingEvent {
  @override
  List<Object?> get props => [];
}
class FinishLoading extends LoadingEvent {
  @override
  List<Object?> get props => [];
}
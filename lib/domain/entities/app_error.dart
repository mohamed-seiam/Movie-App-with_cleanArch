import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;

  const AppError({required this.message});

  @override
  List<Object?> get props => [message];
}
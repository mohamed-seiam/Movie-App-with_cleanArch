part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class LoginInitialEvent extends LoginEvent {
  final String userName;
  final String password;

 const LoginInitialEvent({required this.userName, required this.password});
  @override
  List<Object?> get props => [userName,password];
}

class LogoutEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
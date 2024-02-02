import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/authentication_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

import '../entities/login_request_params.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async {
    return _authenticationRepository.loginUser(params.toJson());
  }
}


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/domain/entities/login_request_params.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/usecases/login_user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitialEvent) {
        final eitherResponse = await loginUser(LoginRequestParams(
            userName: event.userName, password: event.password));
        eitherResponse.fold(
          (l) {
            var message = getErrorMessage(l.appErrorType);
            emit(LoginError(errorMessage: message));
          },
          (r) => emit(LoginSuccess()),
        );
      }
    });
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstance.noNetwork;
      case AppErrorType.api:
      case AppErrorType.dataBase:
        return TranslationConstance.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstance.sessionDenied;
      default:
        return TranslationConstance.wrongUsernamePassword;
    }
  }
}

import 'package:hive/hive.dart';
import 'package:movies_app/common/constance/app_string_constance.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    final authenticationBox = await Hive.openBox(AppStringConstance.kAuthBox);
    return await authenticationBox.put(
        AppStringConstance.sessionIdKey, sessionId);
  }
}

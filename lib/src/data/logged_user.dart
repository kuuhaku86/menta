import 'package:menta/src/classes/user.dart';

class LoggedUser {
  User state_user;
  static LoggedUser _instance;

  factory LoggedUser() {
    return _instance;
  }

  LoggedUser._internal(User user) {
    state_user = user;
  }

  static Login(User user) {
    if (_instance != null) return;
    _instance = LoggedUser._internal(user);
  }

  static Logout() {
    _instance = null;
  }

  static Future<bool> isLogin() async {
    return _instance != null ? true : false;
  }

  User getUser() => state_user;
}

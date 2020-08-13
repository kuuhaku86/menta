import 'package:menta/src/classes/user.dart';
import 'package:menta/src/data/dummy.dart';
import 'package:menta/src/utils/user_type.dart';

class AppAuth {
  static bool emailExist(String email) {
    for (var item in list_user) {
      if (item.email == email) return true;
    }

    return false;
  }

  static User accountExist({String email, String password, UserType user_type}) {
    for (var item in list_user) {
      if (item.email == email) {
        return (item.password != password || item.type != user_type) ? null : item;
      }
    }

    return null;
  }
}

import 'package:flutter/widgets.dart';
import 'package:menta/src/utils/user_type.dart';

class UserTypeData {
  Image image;
  String name;
  UserType user_type;

  UserTypeData(this.user_type, this.name, this.image);
}

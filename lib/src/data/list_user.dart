import 'package:menta/src/classes/user.dart';
import 'package:menta/src/utils/user_type.dart';

List<User> list_user = [
  User("Dummy", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummy@email.com", "dummy123",UserType.psychiatrist),
  User("DummyPatient", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummypatient@email.com", "dummy123",UserType.patient),
];

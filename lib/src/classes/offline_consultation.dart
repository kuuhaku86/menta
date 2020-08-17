import 'package:menta/src/classes/user.dart';

class OfflineConsultation {
  DateTime start, finish;
  User patient;
  String timestamps;

  OfflineConsultation({this.start, this.finish, this.patient, this.timestamps});
}

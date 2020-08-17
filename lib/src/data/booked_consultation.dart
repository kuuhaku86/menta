import 'package:menta/src/classes/offline_consultation.dart';
import 'package:menta/src/data/dummy.dart';

List<OfflineConsultation> list_booked_consultation = [
  OfflineConsultation(start: DateTime.parse("1969-07-20 08:00:00Z"), finish: DateTime.parse("1969-07-20 10:00:00Z"), patient: list_user[2], timestamps: '9:43 AM'),
  OfflineConsultation(start: DateTime.parse("1969-07-20 10:30:00Z"), finish: DateTime.parse("1969-07-20 12:30:00Z"), patient: list_user[3], timestamps: '8:30 PM'),
  OfflineConsultation(start: DateTime.parse("1969-07-20 13:00:00Z"), finish: DateTime.parse("1969-07-20 15:00:00Z"), patient: list_user[4], timestamps: '10:25 AM'),
];

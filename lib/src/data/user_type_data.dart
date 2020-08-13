import 'package:flutter/widgets.dart';
import 'package:menta/src/classes/user_type_data.dart';
import 'package:menta/src/utils/user_type.dart';

double scale = 0.25;

var map_user_type_data = {
  UserType.psychiatrist: UserTypeData(
      UserType.psychiatrist,
      "Psychiatrist",
      Image.asset(
        "assets/images/psychiatrist_icon.png",
        fit: BoxFit.cover,
      )),
  UserType.patient: UserTypeData(
      UserType.patient,
      "Patient",
      Image.asset(
        "assets/images/patient_icon.png",
        fit: BoxFit.cover,
      ))
};

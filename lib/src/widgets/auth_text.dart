import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/user_type.dart';

Text appendAuthText(UserType user_type, String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.grey_font,
      fontSize: 20,
    ),
  );
}
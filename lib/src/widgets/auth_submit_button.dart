import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';

RaisedButton submitButton({bool isButtonEnabled, String text, VoidCallback callback}) {
  return RaisedButton(
    padding: EdgeInsets.all(0),
    child: Container(
      height: 45,
      width: 120,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    ),
    onPressed: isButtonEnabled ? callback : null,
  );
}

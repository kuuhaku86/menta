import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';

class AuthTitle extends StatelessWidget {
  AuthTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.big_blue_font,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

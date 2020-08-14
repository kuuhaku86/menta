import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';

Container authBottomText({
  BuildContext context,
  String unlinked_text,
  String linked_text,
  StatefulWidget destination
}) {
  return Container(
    height: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          unlinked_text,
          style: TextStyle(
            color: AppColors.grey_font,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          child: Text(
            linked_text,
            style: TextStyle(
              color: AppColors.big_blue_font,
              decoration: TextDecoration.underline,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          onTap: () => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) {
              return destination;
            }))
          },
        ),
      ],
    ),
  );
}

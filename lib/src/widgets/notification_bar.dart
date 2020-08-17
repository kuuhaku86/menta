import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menta/src/utils/fonts.dart';

Widget appendNotificationBar(BuildContext context, String title) {
    return Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        height: 80,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Stack(alignment: Alignment.centerLeft, children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0XFF224267),
              ),
            ),
          ),

          // Name
          Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0XFF2B3137),
                    fontFamily: AppFonts.PRIMARY,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ))
        ]));
}
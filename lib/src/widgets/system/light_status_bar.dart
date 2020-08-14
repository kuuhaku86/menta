import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightStatusBar extends StatelessWidget {
  final child;

  LightStatusBar({@required this.child});

  @override
  Widget build(context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      sized: false,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

// TODO: fixing bug
class CirclePhoto extends StatelessWidget {
  final String path;
  final String url;
  final double height;
  final double width;

  CirclePhoto({this.path, this.url, this.height, this.width});

  @override
  Widget build(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: url != null ? _network : _asset,
    );
  }

  get _network {
    return Image.network(
      url,
      height: height,
      width: width,
    );
  }

  get _asset {
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  }
}

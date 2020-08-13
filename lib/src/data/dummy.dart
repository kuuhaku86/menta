import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/user.dart';
import 'package:menta/src/pages/home.dart';
import 'package:menta/src/utils/user_type.dart';

List<User> list_user = [
  User("Dummy", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummy@email.com", "dummy123",UserType.psychiatrist),
  User("DummyPatient", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummypatient@email.com", "dummy123",UserType.patient),
];

List<CustomListItemTwo> list_story = [
  CustomListItemTwo(
    thumbnail: Container(
      decoration: const BoxDecoration(color: Colors.pink),
    ),
    title: 'Flutter 1.0 Launch',
    subtitle:
    'Flutter continues to improve and expand its horizons.'
        'This text should max out at two lines and clip',
    author: 'Dash',
    publishDate: 'Dec 28',
    readDuration: '5 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      decoration: const BoxDecoration(color: Colors.blue),
    ),
    title: 'Flutter 1.2 Release - Continual updates to the framework',
    subtitle: 'Flutter once again improves and makes updates.',
    author: 'Flutter',
    publishDate: 'Feb 26',
    readDuration: '12 mins',
  ),
];

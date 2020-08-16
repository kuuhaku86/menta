import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/user.dart';
import 'package:menta/src/pages/home.dart';
import 'package:menta/src/utils/user_type.dart';

List<User> list_user = [
  User("Dummy", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummy@email.com", "dummy123",UserType.psychiatrist),
  User("DummyPatient", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "dummypatient@email.com", "dummy123",UserType.patient),
  User("Sutejo", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "sutejo@email.com", "dummy123",UserType.patient),
  User("Danny", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "danny@email.com", "dummy123",UserType.patient),
  User("Jessica", "123123123", DateTime.parse("1990-12-12"), "Sby", 12000, "jessica@email.com", "dummy123",UserType.patient),
];

List<CustomListItemTwo> list_story = [
  CustomListItemTwo(),
  CustomListItemTwo(
    thumbnail: Container(
      child: Image.asset('assets/images/article_one.jpg'),
    ),
    title: 'Why Exploring the Unknown Is So Alluring to Children',
    subtitle: 'New research helps to explain why children thrive on exploration of the unknown.',
    author: 'Christopher Bergland',
    publishDate: 'Dec 28',
    readDuration: '5 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      child: Image.asset('assets/images/article_two.jpg')
    ),
    title: 'Prescribing Psychology Gets a Boost',
    subtitle: 'Prescribing psychology has slowly expanded and now has the foothold it needs to become a force in mental health care.',
    author: 'Carrie H. Kennedy Ph.D.',
    publishDate: 'Feb 26',
    readDuration: '12 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      child: Image.asset('assets/images/article_three.jpg'),
    ),
    title: 'For Generalized Anxiety Disorder, Should You Try Kundalini Yoga?',
    subtitle: 'Although cognitive behavioral therapy may still be the best first-line treatment for anxiety, new research suggests Kundalini yoga also helps lower anxiety.',
    author: 'Christopher Bergland',
    publishDate: 'Mar 20',
    readDuration: '20 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      child: Image.asset('assets/images/article_four.jpg'),
    ),
    title: 'Teams Are More Productive When They Don\'t Work Off Hours',
    subtitle: 'Work stress is hard, but it\'s dramatically harder if we work off-hours, too. Teams that enforce boundaries function better.',
    author: 'Alison Escalante M.D.',
    publishDate: 'May 26',
    readDuration: '10 mins',
  ),
];

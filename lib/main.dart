import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menta/src/classes/enum/environment.dart';
import 'package:menta/src/data/chatting.dart';
import 'package:menta/src/data/logged_user.dart';
import 'package:menta/src/data/psychiatrist.dart';
import 'package:menta/src/pages/chatting/chatting.dart';
import 'package:menta/src/pages/home.dart';
import 'package:menta/src/pages/login.dart';
import 'package:menta/src/pages/searching/searching_page.dart';
import 'package:menta/src/utils/config.dart';
import 'package:menta/src/utils/size.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (c) => PsychiatristProvider(),
      ),
      ChangeNotifierProvider(
        create: (c) => ChattingProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (AppConfigs.env == Environment.DEVELOPMENT) {
      getDummies(context);
    }

    return MaterialApp(
      title: 'Menta',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MainApp(),
//      // Debugging
      home: ChattingPage(),
//      home: HomePage()
    );
  }

  getDummies(context) {
    final psychiatristProvider = Provider.of<PsychiatristProvider>(context);
    psychiatristProvider.getDummies();

    final chattingProvider = Provider.of<ChattingProvider>(context);
    chattingProvider.getDummies();
  }
}

class MainApp extends StatefulWidget {
  MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.height = MediaQuery.of(context).size.height;
    AppSize.width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: AnimatedOpacity(
        opacity: 1,
        duration: Duration(seconds: 3),
        child: Image.asset(
          "assets/images/logo.png",
          height: 100.0,
        ),
      ),
    ));
  }

  _checkLogin() => Timer(Duration(seconds: 3), () async {
        final login = await LoggedUser.isLogin();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return login ? HomePage() : Login();
        }));
      });
}

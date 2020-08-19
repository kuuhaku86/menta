import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menta/src/classes/enum/environment.dart';
import 'package:menta/src/data/booking_invoice.dart';
import 'package:menta/src/data/chatting.dart';
import 'package:menta/src/data/logged_user.dart';
import 'package:menta/src/data/payment.dart';
import 'package:menta/src/data/psychiatrist.dart';
import 'package:menta/src/pages/booking/booked_time.dart';
import 'package:menta/src/pages/home.dart';
import 'package:menta/src/pages/login.dart';
import 'package:menta/src/pages/payment/va_invoice.dart';
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
      ),
      ChangeNotifierProvider(create: (c) => PaymentProvider()),
      ChangeNotifierProvider(create: (c) => BookingInvoice(),)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getDummies(context);

    return MaterialApp(
      title: 'Menta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        VirtualAccountInvoicePage.route: (c) => VirtualAccountInvoicePage()
      },
      home: MainApp(),
//      // Debugging
//      home: SearchingPage(),
//      home: HomePage()
    );
  }

  getDummies(context) {
    if (AppConfigs.env != Environment.DEVELOPMENT) return;

    final psychiatristProvider = Provider.of<PsychiatristProvider>(context);
    psychiatristProvider.getDummies();

    final chattingProvider = Provider.of<ChattingProvider>(context);
     chattingProvider.getDummies();

    final paymentProvider = Provider.of<PaymentProvider>(context);
    paymentProvider.getDummies();
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
    getSize(context);

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

  getSize(context) {
    AppSize.height = MediaQuery.of(context).size.height;
    AppSize.width = MediaQuery.of(context).size.width;
  }

  _checkLogin() => Timer(Duration(seconds: 3), () async {
        final login = await LoggedUser.isLogin();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return login ? HomePage() : Login();
        }));
      });
}

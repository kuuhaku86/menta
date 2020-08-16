import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/user.dart';
import 'package:menta/src/data/dummy.dart';
import 'package:menta/src/data/logged_user.dart';
import 'package:menta/src/pages/login.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/user_type.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  User pengguna = LoggedUser().getUser();

  Widget innerContainer(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 100.0,
                      margin: const EdgeInsets.only(bottom: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                    ),
                  )),
              imageSlider()
            ],
          ),
          Expanded(
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: list_story.length,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      child: Text(
                        'Current Story',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    );
                  } else {
                    return list_story[index];
                  }
                },
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget imageSlider() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Center(
        child: SizedBox(
          height: 170,
          child: PageView.builder(
              itemCount: (pengguna.type == UserType.psychiatrist) ? 1 : 2,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (int index) => {setState(() => _index = index)},
              itemBuilder: (_, i) {
                return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: (pengguna.type == UserType.psychiatrist)
                        ? imageContainer(
                            context,
                            'assets/images/booked_time.png',
                            'Offline Consultation')
                        : ((i == 1)
                            ? imageContainer(
                                context,
                                'assets/images/offline_consultation.png',
                                'Offline Consultation')
                            : imageContainer(
                                context,
                                'assets/images/online_consultation.png',
                                'Online Consultation')));
              }),
        ),
      ),
    );
  }

  Widget imageContainer(BuildContext context, String imageUrl, String jenis) {
    return Container(
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 70),
            child: Image.asset('assets/images/logo.png', height: 40),
          ),
          elevation: 0.0,
        ),
        body: innerContainer(context),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.person),
                        ),
                        width: double.infinity,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            pengguna.nama_lengkap,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        width: double.infinity,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            pengguna.email,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [AppColors.start, AppColors.end])),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.settings),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Settings'),
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.edit),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Edit Profile'),
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.help),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Help'),
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.send),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Contact'),
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.person_pin),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('About us'),
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              GestureDetector(
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.exit_to_app),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Logout'),
                      )
                    ],
                  ),
                  onTap: () {
                    LoggedUser.Logout();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                      return Login();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  CustomListItemTwo({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

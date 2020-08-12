import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  Widget innerContainer(BuildContext context){
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
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
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
                )
              ),
              imageSlider()
            ],
          ),
          Expanded(
            child: Container(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Container(
                    child: Text('Current Story', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
                  ),
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
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget imageSlider(){
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Center(
        child: SizedBox(
          height: 170,
          child: PageView.builder(
              itemCount: 2,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (int index) => {
                setState(() => _index = index)
              },
              itemBuilder: (_, i){
                return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: (i == 1) ? imageContainer(context, 'assets/images/konsultasi_offline.png') :
                    imageContainer(context, 'assets/images/konsultasi_online.png')
                );
              }
          ),
        ),
      ),
    );
  }

  Widget imageContainer(BuildContext context, String imageUrl){
    return Container(
      child: Image.asset(imageUrl, fit: BoxFit.fill,),
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
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
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
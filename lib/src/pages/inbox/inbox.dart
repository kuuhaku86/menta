
import 'package:flutter/material.dart';
import 'package:menta/src/data/booked_consultation.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/chat_card.dart';
import 'package:menta/src/widgets/notification_bar.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: true,
      body: LightStatusBar(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: AppSize.notificationBar,
            ),
            appendNotificationBar(context, "Message Inbox"),
            Container(
              child: _list_view_builder(context),
            ),
          ],
      )),
    );
  }

  _list_view_builder(BuildContext context) {
    return ListView.builder(
      itemCount: list_booked_consultation.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return new ChatCard(
          checked: false,
          offline_consultation: list_booked_consultation[index],
        );
      });
  }
}

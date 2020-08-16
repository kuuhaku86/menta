import 'package:flutter/material.dart';
import 'package:menta/src/data/booked_consultation.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/checklist_tile.dart';
import 'package:menta/src/widgets/notification_bar.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';

class BookedConsultationPage extends StatefulWidget {
  @override
  _BookedConsultationPageState createState() => _BookedConsultationPageState();
}

class _BookedConsultationPageState extends State<BookedConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: LightStatusBar(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: AppSize.notificationBar,
            ),
            appendNotificationBar(context, "Today's Offline Consultation"),
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
        return new OfflineConsultationCard(
          checked: false,
          offline_consultation: list_booked_consultation[index],
        );
      });
  }
}

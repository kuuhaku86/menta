import 'package:flutter/material.dart';
import 'package:menta/src/data/booked_consultation.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/checklist_tile.dart';
import 'package:menta/src/widgets/notification_bar.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class BookedConsultationPage extends StatefulWidget {
  @override
  _BookedConsultationPageState createState() => _BookedConsultationPageState();
}

class _BookedConsultationPageState extends State<BookedConsultationPage> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

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
            appendNotificationBar(context, "Today's Offline Consultation"),
            Expanded(
              child: _list_view_builder(context)
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
        if(index == 0){
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: TableCalendar(
                    calendarController: _calendarController,
                    calendarStyle: CalendarStyle(
                      selectedColor: Colors.deepOrange[400],
                      todayColor: Colors.deepOrange[200],
                      markersColor: Colors.brown[700],
                      outsideDaysVisible: false,
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.deepOrange[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
              ),
              OfflineConsultationCard(
                checked: false,
                offline_consultation: list_booked_consultation[index],
              )
            ],
          );
        }
        return new OfflineConsultationCard(
          checked: false,
          offline_consultation: list_booked_consultation[index],
        );
      });
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menta/src/classes/offline_consultation.dart';
import 'package:menta/src/utils/colors.dart';

class OfflineConsultationCard extends StatefulWidget {
  bool checked;
  OfflineConsultation offline_consultation;

  OfflineConsultationCard({this.checked, this.offline_consultation});

  @override
  _OfflineConsultationCardState createState() => _OfflineConsultationCardState(
      checked: checked, offline_consultation: offline_consultation);
}

class _OfflineConsultationCardState extends State<OfflineConsultationCard> {
  bool checked;
  OfflineConsultation offline_consultation;

  _OfflineConsultationCardState({this.checked, this.offline_consultation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: checked
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.timer,
                      color: AppColors.grey_font,
                    ),
              title: Text(
                DateFormat("HH:mm").format(offline_consultation.start).toString() 
                + " - " 
                + DateFormat("HH:mm").format(offline_consultation.finish).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                offline_consultation.patient.nama_lengkap,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  checked ?
                  SizedBox() :
                  RaisedButton(
                      child: Text("It's Finished"),
                      onPressed: () => {
                            this.setState(() {
                              checked = true;
                            })
                          }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

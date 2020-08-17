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
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              checked ? Expanded(
                child: Icon(Icons.check, color: Colors.green,),
                flex: 0,
              )
                  : Expanded(
                child: Icon(Icons.timer, color: AppColors.grey_font,),
                flex: 0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat("HH:mm").format(offline_consultation.start).toString()
                                + " - "
                                + DateFormat("HH:mm").format(offline_consultation.finish).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              offline_consultation.patient.nama_lengkap,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: ButtonTheme.bar(
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
                ),
                flex: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

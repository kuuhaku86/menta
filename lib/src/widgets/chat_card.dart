import 'package:flutter/material.dart';
import 'package:menta/src/classes/offline_consultation.dart';
import 'package:menta/src/pages/chatting/chatting.dart';

class ChatCard extends StatefulWidget {
  bool checked;
  OfflineConsultation offline_consultation;

  ChatCard({this.checked, this.offline_consultation});

  @override
  _ChatCardState createState() => _ChatCardState(
      checked: checked, offline_consultation: offline_consultation);
}

class _ChatCardState extends State<ChatCard> {
  bool checked;
  OfflineConsultation offline_consultation;

  _ChatCardState({this.checked, this.offline_consultation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ChattingPage()
          ))
        },
        child: Card(
          elevation: 3,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Icon(Icons.email),
                  ),
                  flex: 0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          offline_consultation.patient.nama_lengkap,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "Konsultasi",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Text(offline_consultation.timestamps),
                  ),
                  flex: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

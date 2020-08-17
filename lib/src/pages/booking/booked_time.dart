import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/classes/working_day.dart';
import 'package:menta/src/data/booking_invoice.dart';
import 'package:menta/src/data/working_hour.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/widgets/booking_type_button.dart';
import 'package:provider/provider.dart';

import '../home.dart';
class BookingPage extends StatefulWidget {
  final PsychiatristModel p;
  final String imageUrl;

  BookingPage({Key key, @required this.p, @required this.imageUrl }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<BookingPage> {
  BookingInvoice invoice;
  List<WorkingDay> morning = [];
  List<WorkingDay> afternoon = [];
  List<WorkingDay> evening = [];
  bool comment = false;

  @override
  void initState() {
    super.initState();
    for(var i=0; i<listDay.length; i++){
      if(listDay[i].day == 'Morning'){
        morning.add(listDay[i]);
      }else if(listDay[i].day == 'Afternoon'){
        afternoon.add(listDay[i]);
      }else {
        evening.add(listDay[i]);
      }
    }
  }

  _setInvoiceDate(DateTime tanggal){
    setState(() {
      invoice.date = DateFormat('yyy-MM-dd').format(tanggal).toString();
    });
  }

  _setInvoiceTime(String time, String day){
    setState(() {
      invoice.timePicked = time;
      invoice.day = day;
    });
  }

  _mainContent(queryData, context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/kantor_edited.jpg',),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: queryData.size.height/5
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 5,
                        top: queryData.size.height/10
                    ),
                    child: Text(widget.p.fullName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,),
                    child: Text(widget.p.expertise, textAlign: TextAlign.center,),
                  ),
                  Container(
                    child: RatingBar(
                        initialRating: widget.p.rating,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        }
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text('Choose Your Slot', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: AppColors.primary,
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                            _setInvoiceDate(date);
                          });
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text('Morning', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: queryData.size.width,
                      height: queryData.size.width * 0.1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: morning.length,
                          itemBuilder: (cxt, idx) {
                            if(morning[idx].day == 'Morning'){
                              return BookingTypeButton(
                                btnText: '${morning[idx].startHour} - ${morning[idx].closingHour}',
                                changeState: () => _setInvoiceTime('${morning[idx].startHour} - ${morning[idx].closingHour}',
                                    morning[idx].day),
                                selected: invoice.timePicked == '${morning[idx].startHour} - ${morning[idx].closingHour}',
                              );
//                              return Text('${morning[idx].startHour} - ${morning[idx].closingHour}');
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text('Afternoon', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: queryData.size.width,
                      height: queryData.size.width * 0.1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: afternoon.length,
                          itemBuilder: (cxt, idx) {
                            if(afternoon[idx].day == 'Afternoon'){
                              return BookingTypeButton(
                                btnText: '${afternoon[idx].startHour} - ${afternoon[idx].closingHour}',
                                changeState: () => _setInvoiceTime('${afternoon[idx].startHour} - ${afternoon[idx].closingHour}',
                                    afternoon[idx].day),
                                selected: invoice.timePicked == '${afternoon[idx].startHour} - ${afternoon[idx].closingHour}',
                              );
//                              return Text('${afternoon[idx].startHour} - ${afternoon[idx].closingHour}');
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text('Evening', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: queryData.size.width,
                      height: queryData.size.width * 0.1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: evening.length,
                          itemBuilder: (cxt, idx) {
                            if(evening[idx].day == 'Evening'){
                              return BookingTypeButton(
                                btnText: '${evening[idx].startHour} - ${evening[idx].closingHour}',
                                changeState: () => _setInvoiceTime('${evening[idx].startHour} - ${evening[idx].closingHour}',
                                    evening[idx].day),
                                selected: invoice.timePicked == '${evening[idx].startHour} - ${evening[idx].closingHour}',
                              );
//                              return Text('${evening[idx].startHour} - ${evening[idx].closingHour}');
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                    child: InkWell(
                      onTap: () => {
                        setState(() {
                          comment = !comment;
                        })
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Icon(Icons.message),
                              ),
                            ),
                            flex: 0,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text('Reviews', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                              child: Text('${widget.p.reviews.length}'),
                            ),
                            flex: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  (comment) ? Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: widget.p.reviews.length,
                      itemBuilder: (ctx, idx) {
                        return Text(widget.p.reviews[idx].content);
                      }
                    ),
                  ) : Container(),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    width: double.infinity,
                    child: RaisedButton(
                      color: (invoice.timePicked != '' && invoice.date != '') ? AppColors.primary : Colors.grey,
                      onPressed: () => {
                        (invoice.timePicked != '' && invoice.date != '') ? _showModalBottomSheet(context) : null
                      },
                      child: Text('Book', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: queryData.size.height/9,
                left: queryData.size.width/3,
              ),
              width: queryData.size.width/3,
              height: queryData.size.height/6,
              child: Card(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
                elevation: 10,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    invoice = Provider.of<BookingInvoice>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: _mainContent(queryData, context),
      ),
    );
  }

  _showModalBottomSheet(ctx){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("CHECKOUT",
                          style: TextStyle(color: Colors.grey,
                              fontWeight: FontWeight.bold, fontSize: 12),),
                        margin: EdgeInsets.only(left: 24, top: 12, bottom: 4),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:  Container(
                          child: Icon(Icons.close, size: 16,),
                          margin: EdgeInsets.only(right: 24, top: 12, bottom: 4),
                        ),
                      ),
                      flex: 0,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Psychiatrist'),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.p.fullName}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    )
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Day'),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('${invoice.date}',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Time'),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: (invoice.day == 'Morning') ?
                      Text('${invoice.timePicked} AM',
                        style: TextStyle(fontWeight: FontWeight.bold),) :
                      Text('${invoice.timePicked} PM',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              )
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Total'),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Rp. 100.000,00',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    )
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,
              child: RaisedButton(
                color: AppColors.primary,
                onPressed: () {
                  invoice.checkout = true;
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
                },
                child: Text('Proceed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
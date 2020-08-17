import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/classes/working_day.dart';
import 'package:menta/src/data/booking_invoice.dart';
import 'package:menta/src/data/working_hour.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/widgets/booking_type_button.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  PsychiatristModel p;
  String imageUrl;

  BookingPage({Key key, @required this.p, @required this.imageUrl }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<BookingPage> {
  BookingInvoice invoice;

  @override
  void initState() {
    super.initState();
  }

  _setInvoiceDate(String tanggal){
    setState(() {
      invoice.timePicked = tanggal;
    });
  }

  _setInvoiceTime(String time, String day){
    setState(() {
      invoice.date = time;
      invoice.day = day;
    });
  }

  _mainContent(queryData, context, morning, afternoon, evening) {
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
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                      margin: EdgeInsets.only(top: 20, left: 20),
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
//                          _selectedValue = date;
                          });
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text('Morning', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
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
                                selected: invoice.date == '${morning[idx].startHour} - ${morning[idx].closingHour}',
                              );
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text('Afternoon', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
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
                                selected: invoice.date == '${afternoon[idx].startHour} - ${afternoon[idx].closingHour}',
                              );
                            return Text('text');
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text('Evening', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
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
                                selected: invoice.date == '${evening[idx].startHour} - ${evening[idx].closingHour}',
                              );
                            }
                            return null;
                          }
                      ),
                    ),
                  ),
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
    List<WorkingDay> morning = listDay;
    List<WorkingDay> afternoon = listDay;
    List<WorkingDay> evening = listDay;

    return SafeArea(
      child: Scaffold(
        body: _mainContent(queryData, context, morning, afternoon, evening),
      ),
    );
  }
}
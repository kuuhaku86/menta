import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/consultation.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/data/psychiatrist.dart';
import 'package:menta/src/pages/booking/booked_time.dart';
import 'package:menta/src/pages/chatting/chatting.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/utils/images.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class SearchingPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SearchingPage> {
  PsychiatristProvider psychiatristProvider;

  @override
  Widget build(context) {
    setUpProvider(context);

    return Scaffold(
      body: LightStatusBar(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, AppSize.notificationBar, 15, 0),
          child: Column(
            children: [
              _searchField,
              _filter,
              Expanded(
                child: _psychiatristList(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  setUpProvider(context) {
    psychiatristProvider = Provider.of<PsychiatristProvider>(context);
  }

  get _searchField {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.keyboard_voice),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: "Search Psychiatrist"),
      ),
    );
  }

  get _filter {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        children: [
          Text(
            "Sort by:",
            style: TextStyle(
                color: AppColors.textGray1,
                fontFamily: AppFonts.PRIMARY,
                fontSize: 13.0),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Rating",
            style: TextStyle(
                color: AppColors.primaryDark,
                fontFamily: AppFonts.PRIMARY,
                fontSize: 13.0),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Color(0XFF223B75),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              Image.asset(AppImages.filter),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Filter",
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontFamily: AppFonts.PRIMARY,
                      fontSize: 13.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bool get _isOnline {
    return psychiatristProvider.currentConsultationType == Consultation.ONLINE;
  }

  _psychiatristList(context) {
    _listItem(PsychiatristModel p, {position}) {
      keyValue(key, value, {endspace = 5.0}) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              key,
              style: TextStyle(
                  fontFamily: AppFonts.PRIMARY,
                  fontSize: 10.0,
                  color: AppColors.textGray2),
            ),
            Text(
              value,
              style: TextStyle(
                  fontFamily: AppFonts.PRIMARY,
                  fontSize: 11.0,
                  color: AppColors.primaryText),
            )
          ],
        );
      }

      communicateBtn(icon, text) {
        return Row(
          children: [
            Image.asset(icon),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 11.0,
                  fontFamily: AppFonts.PRIMARY,
                  color: AppColors.textGray1),
            )
          ],
        );
      }

      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  /*CirclePhoto(
                    url:
                        "https://img.okezone.com/content/2020/08/12/51/2261120/cristiano-ronaldo-pindah-ke-klub-divisi-tiga-meksiko-3JjmqpIina.jpg",
                    width: 36.0,
                    height: 36.0,
                  ),*/
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://img.okezone.com/content/2020/08/12/51/2261120/cristiano-ronaldo-pindah-ke-klub-divisi-tiga-meksiko-3JjmqpIina.jpg",
                    ),
                    radius: 25.0,
                  ),

                  SizedBox(
                    width: 15,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          p.fullName,
                          style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 15.0,
                              fontFamily: AppFonts.PRIMARY,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 5.0,
                        ),

                        // Expertise
                        Text(
                          p.expertise,
                          style: TextStyle(
                            fontFamily: AppFonts.PRIMARY,
                            color: AppColors.textGray1,
                            fontSize: 12.0,
                          ),
                        ),

                        SizedBox(
                          height: 5.0,
                        ),

                        // Location
                        Column(
                          children: [
                            Image.asset(AppImages.pin),
                            Text(
                              p.city,
                              style: TextStyle(
                                  color: AppColors.textGray1,
                                  fontSize: 10.0,
                                  fontFamily: AppFonts.PRIMARY),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  // Rating and friend
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Rating
                      Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                        color: AppColors.yellowRating,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            children: [
                              Image.asset(AppImages.star),
                              Text(
                                "${p.rating}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppFonts.PRIMARY,
                                    fontSize: 11.0),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Availability
                      Text(
                        "Available Today",
                        style: TextStyle(
                            color: AppColors.greenAvailable,
                            fontSize: 10.0,
                            fontFamily: AppFonts.PRIMARY),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // Key-value
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        keyValue("Experience", "${p.experienceInYears} Years"),
                        keyValue("Likes",
                            "${p.likesInNumber} (${p.likesInPercentage}%)"),
                        keyValue("Reviews", "${p.reviews.length}")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  )
                ],
              ),

              SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),

                  // Communication buttons
                  Expanded(
                    /*child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              _goToChatting(context, position);
                            },
                            child: communicateBtn(AppImages.chat, "Chat"),
                          ),
                          communicateBtn(AppImages.call, "Audio"),
                          communicateBtn(AppImages.video, "Video")
                        ],
                      ),
                    ),
                  )*/
                    child: Container(),
                  ),

                  // Booking button
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: MaterialButton(
                      onPressed: () {
                        final page = _isOnline
                            ? ChattingPage()
                            : BookingPage(
                                p: p,
                                imageUrl:
                                    "https://img.okezone.com/content/2020/08/12/51/2261120/cristiano-ronaldo-pindah-ke-klub-divisi-tiga-meksiko-3JjmqpIina.jpg",
                              );
                        final route = MaterialPageRoute(builder: (c) => page);
                        Navigator.push(context, route);
                      },
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Text(
                        _isOnline ? "Chat" : "Book",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts.PRIMARY,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    final list = psychiatristProvider.list;

    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length * 2,
          itemBuilder: (context, i) {
            final index = i ~/ 2;

            if (i.isOdd) {
              return SizedBox(
                height: 15,
              );
            }

            return _listItem(list[index], position: index);
          }),
    );
  }
}

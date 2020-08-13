import 'package:flutter/material.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/utils/images.dart';

class SearchingPage extends StatefulWidget {

  @override
  State createState() => _State();
}

class _State extends State<SearchingPage> {

  @override
  Widget build(context) {
    return Scaffold(
      body: _psychiatristList,
    )
  }

  listItem(PsychiatristModel p) {
    keyValue(key, value) {
      return Column(
        children: [
          Text(
            key,
            style: TextStyle(
                fontFamily: AppFonts.LATO,
                fontSize: 10.0,
                color: AppColors.textGray2
            ),
          ),
          Text(
            value,
            style: TextStyle(
                fontFamily: AppFonts.LATO,
                fontSize: 11.0,
                color: AppColors.primaryText
            ),
          )
        ],
      );
    }

    communicateBtn(icon, text) {
      return Row(
        children: [
          Image.asset(icon),
          Text(
            text,
            style: TextStyle(
                fontSize: 11.0,
                fontFamily: AppFonts.LATO,
                color: AppColors.textGray1
            ),
          )
        ],
      )
    }

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0)
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    "https://img.okezone.com/content/2020/08/12/51/2261120/cristiano-ronaldo-pindah-ke-klub-divisi-tiga-meksiko-3JjmqpIina.jpg",
                    height: 36.0,
                    width: 36.0,
                  ),
                ),
                Column(
                  children: [
                    // Name
                    Text(
                      p.fullName,
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 15.0,
                          fontFamily: AppFonts.LATO,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    // Expertise
                    Text(
                      p.expertise,
                      style: TextStyle(
                        fontFamily: AppFonts.LATO,
                        color: AppColors.textGray1,
                        fontSize: 12.0,
                      ),
                    ),

                    // Location
                    Column(
                      children: [
                        Image.asset(
                            AppImages.pin
                        ),
                        Text(
                          p.city,
                          style: TextStyle(
                              color: AppColors.textGray1,
                              fontSize: 10.0,
                              fontFamily: AppFonts.LATO
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),

            // Key-value
            Row(
              children: [
                keyValue("Experience", "${p.experienceInYears} Years"),
                keyValue(
                    "Likes", "${p.likesInNumber} (${p.likesInPercentage}%)"),
                keyValue("Reviews", "${p.reviews.length}")
              ],
            ),

            // Communication buttons
            Row(
              children: [
                communicateBtn(AppImages.chat, "Chat"),
                communicateBtn(AppImages.call, "Audio"),
                communicateBtn(AppImages.video, "Video")
              ],
            )
          ],
        ),
      ),
    )
  }

  get _psychiatristList {
    // Temporary
    final list = [PsychiatristModel()]
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return listItem(list[i]);
        }
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/classes/review.dart';

class PsychiatristProvider extends ChangeNotifier {
  var list = <PsychiatristModel>[];

  getDummies() {
    list.clear();

    // Dummies
    final psychiatrist = PsychiatristModel(
      fullName: "Dr. Luke Reynolds",
      rating: 4.5,
      expertise:
          "Dermatologist, Skin ethics Skin Clinic & Dermatosurgery Center",
      likesInNumber: 25,
      likesInPercentage: 40,
      experienceInYears: 20,
      city: "Branch: Farmacias Del Ahorro",
    );

    final review = ReviewModel();
    for (var i = 0; i < 25; i++) {
      psychiatrist.reviews.add(review);
    }

    for (var i = 0; i < 10; i++) {
      list.add(psychiatrist);
    }
  }
}

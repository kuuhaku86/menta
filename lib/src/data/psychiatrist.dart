import 'package:flutter/cupertino.dart';
import 'package:menta/src/classes/consultation.dart';
import 'package:menta/src/classes/psychiatrist.dart';
import 'package:menta/src/classes/review.dart';

class PsychiatristProvider extends ChangeNotifier {
  var list = <PsychiatristModel>[];
  var currentConsultationType = Consultation.ONLINE;

  getDummies() {
    list.clear();

    final psychiatrists = <PsychiatristModel>[
      PsychiatristModel(
        fullName: "dr. Luke Reynolds",
        rating: 4.5,
        expertise: "Anxiety and Mood",
        likesInNumber: 30,
        likesInPercentage: 95,
        experienceInYears: 25,
        city: "Branch: Farmacias Del Ahorro",
      ),
      PsychiatristModel(
        fullName: "dr. Ardiansyah Aku",
        rating: 4.3,
        expertise: "Personality and Confidence",
        likesInNumber: 20,
        likesInPercentage: 90,
        experienceInYears: 10,
        city: "Branch: Soerabaja",
      ),
      PsychiatristModel(
        fullName: "dr. Anti Frustation",
        rating: 4.4,
        expertise: "Disappointment and Frustation",
        likesInNumber: 20,
        likesInPercentage: 95,
        experienceInYears: 20,
        city: "Branch: Madioen",
      ),
      PsychiatristModel(
        fullName: "dr. Luke Reynolds",
        rating: 4.5,
        expertise: "Anxiety and Mood",
        likesInNumber: 30,
        likesInPercentage: 95,
        experienceInYears: 25,
        city: "Branch: Farmacias Del Ahorro",
      ),

      // TODO: differentiate
      PsychiatristModel(
        fullName: "dr. Ardiansyah Aku",
        rating: 4.3,
        expertise: "Personality and Confidence",
        likesInNumber: 20,
        likesInPercentage: 90,
        experienceInYears: 10,
        city: "Branch: Soerabaja",
      ),
      PsychiatristModel(
        fullName: "dr. Anti Frustation",
        rating: 4.4,
        expertise: "Disappointment and Frustation",
        likesInNumber: 20,
        likesInPercentage: 95,
        experienceInYears: 20,
        city: "Branch: Madioen",
      ),
    ];

    psychiatrists.forEach((p) {
      p.reviews = [
        ReviewModel(rating: 5, content: "Friendly"),
        ReviewModel(rating: 5, content: "my restlessness is now gone"),
        ReviewModel(rating: 4, content: "Solving but please be more friendly"),
        ReviewModel(
            rating: 4,
            content: "Please be more timely. But anyway he is so smart")
      ];
    });

    list = psychiatrists;

    /*final psychiatrist = PsychiatristModel(
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
    }*/
  }
}

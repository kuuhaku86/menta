import 'package:menta/src/classes/review.dart';

class PsychiatristModel {
  var fullName = "";
  var rating = 5.0;
  var expertise = "";
  var city = "";
  var experienceInYears = 0;
  var likesInNumber = 0;
  var likesInPercentage = 0;
  var reviews = <ReviewModel>[];

  PsychiatristModel(
      {this.fullName = "",
      this.rating = 5.0,
      this.expertise = "",
      this.city = "",
      this.experienceInYears = 0,
      this.likesInNumber = 0,
      this.likesInPercentage = 0});
}

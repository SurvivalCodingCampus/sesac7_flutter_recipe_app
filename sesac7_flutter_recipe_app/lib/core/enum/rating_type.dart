enum RatingType {
  gradeFive('5'),
  gradeFour('4'),
  gradeThree('3'),
  gradeTwo('2'),
  gradeOne('1'),
  gradeZero('0');

  final String value;

  const RatingType(this.value);
}

extension RatingTypeExtension on RatingType {
  int getIntValue() {
    switch (this) {
      case RatingType.gradeZero:
        return 0;
      case RatingType.gradeOne:
        return 1;
      case RatingType.gradeTwo:
        return 2;
      case RatingType.gradeThree:
        return 3;
      case RatingType.gradeFour:
        return 4;
      case RatingType.gradeFive:
        return 5;
    }
  }
}

extension IntToRatingTypeExtension on int {
  RatingType intToRatingType() {
    switch (this) {
      case 0:
        return RatingType.gradeZero;
      case 1:
        return RatingType.gradeOne;
      case 2:
        return RatingType.gradeTwo;
      case 3:
        return RatingType.gradeThree;
      case 4:
        return RatingType.gradeFour;
      case 5:
        return RatingType.gradeFive;
      default:
        return RatingType.gradeZero;
    }
  }
}

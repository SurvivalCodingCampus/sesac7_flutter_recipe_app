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

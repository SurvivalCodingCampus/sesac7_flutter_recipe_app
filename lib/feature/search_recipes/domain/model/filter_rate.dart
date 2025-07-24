enum FilterRate {
  one,
  two,
  three,
  four,
  five;

  int toInt() {
    return switch (this) {
      FilterRate.one => 1,
      FilterRate.two => 2,
      FilterRate.three => 3,
      FilterRate.four => 4,
      FilterRate.five => 5,
    };
  }
}

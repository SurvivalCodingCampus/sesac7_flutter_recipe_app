enum FilterRate {
  one,
  two,
  three,
  four,
  five;

  static FilterRate? fromInt(int value) {
    if (![1, 2, 3, 4, 5].contains(value)) return null;
    return values.firstWhere((e) => e.toInt() == value);
  }

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

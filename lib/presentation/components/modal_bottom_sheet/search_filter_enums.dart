enum TimeFilter {
  all('All'),
  newest('Newest'),
  oldest('Oldest'),
  popularity('Popularity');

  final String displayName; // UI에 표시될 이름
  const TimeFilter(this.displayName);
}

enum RatingFilter {
  /// 1점 (가장 낮은 점수) selected ☆, unselected ★,
  oneStar('1★'),

  /// 2점
  twoStars('2★'),

  /// 3점
  threeStars('3★'),

  /// 4점
  fourStars('4★'),

  /// 5점 (가장 높은 점수)
  fiveStars('5★');

  final String displayName; // UI에 표시될 이름
  const RatingFilter(this.displayName);
}

enum CategoryFilter {
  all('All'),
  cereal('Cereal'),
  vegetables('Vegetables'),
  dinner('Dinner ★'),
  chinese('Chinese'),
  localDish('Local Dish'),
  fruit('Fruit'),
  breakfast('Breakfast'),
  spanish('Spanish'),
  lunch('Lunch');

  final String displayName; // UI에 표시될 이름
  const CategoryFilter(this.displayName);
}
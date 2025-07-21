enum TimeFilter {
  all,
  newest,
  oldest,
  popularity,
}

enum RateFilter {
  five,
  four,
  three,
  two,
  one,
}

class FilterModel {
  final TimeFilter time;
  final RateFilter? rate;
  final String category;

  const FilterModel({
    required this.time,
    this.rate,
    required this.category,
  });

  factory FilterModel.initial() {
    return const FilterModel(
      time: TimeFilter.all,
      rate: null,
      category: 'All',
    );
  }

  FilterModel copyWith({
    TimeFilter? time,
    RateFilter? rate,
    String? category,
  }) {
    return FilterModel(
      time: time ?? this.time,
      rate: rate ?? this.rate,
      category: category ?? this.category,
    );
  }
}

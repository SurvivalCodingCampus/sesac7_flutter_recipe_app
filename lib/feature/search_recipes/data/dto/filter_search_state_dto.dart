class FilterSearchStateDto {
  String? filterSortBy;
  int? filterRate;
  String? filterCategory;

  FilterSearchStateDto({
    this.filterSortBy,
    this.filterRate,
    this.filterCategory,
  });

  factory FilterSearchStateDto.fromJson(Map<String, dynamic> json) =>
      FilterSearchStateDto(
        filterSortBy: json['filterSortBy'] as String?,
        filterRate: json['filterRate'] as int?,
        filterCategory: json['filterCategory'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'filterSortBy': filterSortBy,
    'filterRate': filterRate,
    'filterCategory': filterCategory,
  };
}

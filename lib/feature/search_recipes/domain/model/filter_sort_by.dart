import 'package:flutter_recipe_app/core/utils/extension/string_extension.dart';

enum FilterSortBy {
  all,
  newest,
  oldest,
  popularity;

  factory FilterSortBy.fromString(String value) {
    return values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => all,
    );
  }

  @override
  String toString() => name.capitalizeFirstLetter();
}

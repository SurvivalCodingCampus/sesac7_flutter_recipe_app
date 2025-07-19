import 'package:flutter_recipe_app/core/extension/string_extension.dart';

enum FilterSortBy {
  all,
  newest,
  oldest,
  popularity;

  @override
  String toString() {
    return switch (this) {
      FilterSortBy.all => name.capitalizeFirstLetter(),
      FilterSortBy.newest => name.capitalizeFirstLetter(),
      FilterSortBy.oldest => name.capitalizeFirstLetter(),
      FilterSortBy.popularity => name.capitalizeFirstLetter(),
    };
  }
}

import 'package:flutter_recipe_app/core/utils/extension/string_extension.dart';

enum FilterSortBy {
  all,
  newest,
  oldest,
  popularity;

  @override
  String toString() => name.capitalizeFirstLetter();
}

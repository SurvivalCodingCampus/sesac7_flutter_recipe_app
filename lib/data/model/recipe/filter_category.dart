import 'package:flutter_recipe_app/core/extension/string_extension.dart';

enum FilterCategory {
  all,
  cereal,
  vegetables,
  dinner,
  chinese,
  localDish,
  fruit,
  breakFast,
  spanish,
  lunch;

  @override
  String toString() => name.capitalizeFirstLetter();
}

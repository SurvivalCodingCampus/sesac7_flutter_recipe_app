import 'package:flutter_recipe_app/core/utils/extension/string_extension.dart';

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

  factory FilterCategory.fromString(String value) {
    return values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => all,
    );
  }

  @override
  String toString() => name.capitalizeFirstLetter();
}

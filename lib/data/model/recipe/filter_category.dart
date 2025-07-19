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
  String toString() {
    return switch (this) {
      FilterCategory.all => name.capitalizeFirstLetter(),
      FilterCategory.cereal => name.capitalizeFirstLetter(),
      FilterCategory.vegetables => name.capitalizeFirstLetter(),
      FilterCategory.dinner => name.capitalizeFirstLetter(),
      FilterCategory.chinese => name.capitalizeFirstLetter(),
      FilterCategory.localDish => name.capitalizeFirstLetter(),
      FilterCategory.fruit => name.capitalizeFirstLetter(),
      FilterCategory.breakFast => name.capitalizeFirstLetter(),
      FilterCategory.spanish => name.capitalizeFirstLetter(),
      FilterCategory.lunch => name.capitalizeFirstLetter(),
    };
  }
}

import 'package:flutter_recipe_app/core/utils/extension/string_extension.dart';

enum HomeRecipeCategory {
  all,
  indian,
  italian,
  asian,
  chinese,
  japanese;

  @override
  String toString() => name.capitalizeFirstLetter();
}


import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/model/recipe_menu_item.dart';

part 'recipe_ingredients_action.freezed.dart';

@freezed
sealed class RecipeIngredientsAction with _$RecipeIngredientsAction {
  const factory RecipeIngredientsAction.menuItemSelected(RecipeMenuItem item) = MenuItemSelected;
}
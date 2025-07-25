import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient_action.freezed.dart";

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.tapBack() = TapBack;
  const factory IngredientAction.tapMenu() = TapMenu;
  const factory IngredientAction.tapRecipeBookmark() = TapRecipeBookmark;
  const factory IngredientAction.tapFollow() = TapFollow;
  const factory IngredientAction.changeTab(int index) = ChangeTab;
}

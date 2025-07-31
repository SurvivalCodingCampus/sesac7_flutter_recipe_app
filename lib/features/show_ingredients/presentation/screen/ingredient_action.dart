import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.clickBackButton() = ClickBackButton;

  const factory IngredientAction.switchTab(int index) = SwitchTab;

  const factory IngredientAction.clickMenuButton() = ClickMenuButton;
}

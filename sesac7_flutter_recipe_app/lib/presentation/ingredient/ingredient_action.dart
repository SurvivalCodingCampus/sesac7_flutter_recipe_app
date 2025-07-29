import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.clickIngredientBackButton() =
      ClickIngredientBackButton;

  const factory IngredientAction.changeIngredientTapSelectedIndex(int index) =
      ChangeIngredientTapSelectedIndex;

  const factory IngredientAction.clickPopupMenuItem(PopupMenuType menuType) =
      ClickPopupMenuItem;
}

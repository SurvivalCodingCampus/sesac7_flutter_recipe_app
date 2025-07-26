import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/recipe.dart';

part 'main_screen_action.freezed.dart';

/*
*   final void Function(String category) onSelectCatetory;
  final void Function(Recipe recipe) onToggleFavorite;*/
@freezed
sealed class MainScreenAction with _$MainScreenAction {
  const factory MainScreenAction.onSelectCategory(String category) = SelectCategory;
  const factory MainScreenAction.onToggleFavorite(Recipe recipe) = ToggleFavorite;
}
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default("monkey96") String userId,
    @Default(false) bool isLoading,
    @Default(0) int tabIndex,
    @Default([
      'All',
      'Indian',
      'Korean',
      'Italian',
      'Japanese',
      'Chinese',
      'Radioactive',
    ])
    List<String> tabs,
    @Default([]) List<Recipe> currentRecipes,
  }) = _MainState;
}

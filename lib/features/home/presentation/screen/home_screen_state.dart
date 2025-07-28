import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';

part 'home_screen_state.freezed.dart';
part 'home_screen_state.g.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default('All') String selectedCategory,
    @Default(false) bool isLoading,
    @Default([]) List<Recipe> recipes,
    @Default([]) List<Recipe> filteredRecipes,
  }) = _HomeScreenState;

  factory HomeScreenState.fromJson(Map<String, Object?> json) =>
      _$HomeScreenStateFromJson(json);
}

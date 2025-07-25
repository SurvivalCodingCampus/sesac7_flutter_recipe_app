import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) final List<Recipe> recipes,
    @Default(<String>[
      'All',
      'American',
      'Asian',
      'British',
      'Chinese',
      'French',
      'Indian',
      'Italian',
      'Japanese',
    ]) final List<String> categories,
    @Default('All') String selectedCategory,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(false) final bool isLoading,
  }) = _HomeState;
}

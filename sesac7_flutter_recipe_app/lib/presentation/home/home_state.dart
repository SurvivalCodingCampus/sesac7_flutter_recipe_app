import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default({}) Set<String> categories,
    @Default('All') String category,
    @Default([]) List<Recipe> categoryRecipes,
  }) = _HomeState;
}

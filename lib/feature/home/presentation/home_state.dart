import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "home_state.freezed.dart";

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _HomeState;
}

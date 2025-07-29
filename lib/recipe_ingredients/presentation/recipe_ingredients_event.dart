import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredients_event.freezed.dart';

@freezed
sealed class RecipeIngredientsScreenEvent with _$RecipeIngredientsScreenEvent {
  const factory RecipeIngredientsScreenEvent.showRatingDialog() = ShowRatingDialog;
}
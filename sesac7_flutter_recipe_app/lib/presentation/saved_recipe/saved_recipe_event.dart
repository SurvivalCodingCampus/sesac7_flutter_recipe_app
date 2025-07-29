import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipe_event.freezed.dart';

@freezed
sealed class SavedRecipeEvent with _$SavedRecipeEvent {
  const factory SavedRecipeEvent.changeFavorite() = ChangeFavorite;
}
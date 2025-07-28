import 'package:freezed_annotation/freezed_annotation.dart';

part "saved_recipes_event.freezed.dart";

@freezed
sealed class SavedRecipesEvent with _$SavedRecipesEvent {
  const factory SavedRecipesEvent.showErrorDialog(String message) =
      ShowErrorDialog;
}

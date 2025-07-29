import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipes_event.freezed.dart";

@freezed
sealed class SearchRecipesEvent with _$SearchRecipesEvent {
  const factory SearchRecipesEvent.showErrorDialog(String message) =
      ShowErrorDialog;
  const factory SearchRecipesEvent.showNoSearchResultSnackBar() =
      ShowNoSearchResultSnackBar;
}

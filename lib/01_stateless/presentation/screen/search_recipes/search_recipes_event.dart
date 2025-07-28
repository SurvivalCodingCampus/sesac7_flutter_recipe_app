import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_event.freezed.dart';

@freezed
sealed class SearchRecipesEvent with _$SearchRecipesEvent {
  const factory SearchRecipesEvent.openDialog() = OpenDialog;

  const factory SearchRecipesEvent.navigateHome() = NaviagteHome;

  const factory SearchRecipesEvent.navigatePreviousScreen() =
      NavigatePreviousScreen;

  const factory SearchRecipesEvent.showErrorMessage(String message) =
      ShowErrorMessage;
}

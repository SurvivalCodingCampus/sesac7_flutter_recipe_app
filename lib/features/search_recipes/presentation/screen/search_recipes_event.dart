import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_event.freezed.dart';

@freezed
sealed class SearchRecipesEvent with _$SearchRecipesEvent {
  const factory SearchRecipesEvent.hasNoResult() = HasNoResult;

  const factory SearchRecipesEvent.showFilterBottomSheet() =
      ShowFilterBottomSheet;

  const factory SearchRecipesEvent.showErrorMessage(String error) =
      ShowErrorMessage;
}

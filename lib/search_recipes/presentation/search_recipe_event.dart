
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_event.freezed.dart';

@freezed
sealed class SearchRecipeEvent with _$SearchRecipeEvent {
  const factory SearchRecipeEvent.showEmptyResultSnackBar(String message) = ShowEmptyResultSnackBar;
  const factory SearchRecipeEvent.showNetworkErrorSnackBar(String message) = ShowNetworkErrorSnackBar;
}
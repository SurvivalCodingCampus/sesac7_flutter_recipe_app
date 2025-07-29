import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_event.freezed.dart';

@freezed
sealed class SearchRecipesEvent with _$SearchRecipesEvent {
  const factory SearchRecipesEvent.showEmptyResultError() = ShowEmptyResultError;
  const factory SearchRecipesEvent.showNetworkErrorDialog(NetworkError error) = ShowNetworkErrorDialog;
}
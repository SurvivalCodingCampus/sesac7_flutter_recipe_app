import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.selectCategory(String category) = SelectCategory;
  const factory HomeAction.moveSearchRecipeScreen() = MoveSearchRecipeScreen;
  const factory HomeAction.favoriteStateChange(int recipeId) = FavoriteStateChange;
}

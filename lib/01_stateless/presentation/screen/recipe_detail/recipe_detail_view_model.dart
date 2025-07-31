import 'package:flutter/material.dart';
import '../../../domain/model/recipe.dart';
import 'recipe_detail_state.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final Recipe recipe;

  RecipeDetailState _state = const RecipeDetailState();

  RecipeDetailState get state => _state;
  Recipe get recipeData => recipe;

  RecipeDetailViewModel({required this.recipe});

  void onTabChanged(RecipeTab tab) {
    _state = _state.copyWith(selectedTab: tab);
    notifyListeners();
  }

  void onBookmarkPressed() {
    _state = _state.copyWith(isBookmarked: !_state.isBookmarked);
    notifyListeners();
  }

  void onFollowPressed() {
    _state = _state.copyWith(isFollowing: !_state.isFollowing);
    notifyListeners();
  }

  void onMorePressed() {
    // TODO: 더보기 메뉴 구현
    debugPrint('More button pressed');
  }
}

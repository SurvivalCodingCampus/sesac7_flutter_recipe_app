// 홈 화면의 비즈니스 로직을 처리하는 ViewModel
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/model/user.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/use_case/get_users_use_case.dart';
import 'package:flutter_recipe_app/presentation/screen/home_screen/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetUsersUseCase _getUsersUseCase;

  HomeViewModel(this._getRecipesUseCase, this._getUsersUseCase) {
    fetchData();
  }

  HomeState _state = HomeState();

  HomeState get state => _state;

  Future<void> fetchData() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      // 레시피와 사용자를 동시에 가져옵니다.
      final results = await Future.wait([
        _getRecipesUseCase(),
        _getUsersUseCase(),
      ]);

      final recipesFromRepo = results[0] as List<Recipe>;
      final users = results[1] as List<User>;

      // 사용자 ID를 키로 하는 맵을 만들어 빠른 조회를 가능하게 합니다.
      final userMap = {for (var user in users) user.id: user};

      // 레시피 목록을 순회하며 작성자 정보를 채웁니다.
      final recipesWithAuthors = recipesFromRepo.map((recipe) {
        final author = userMap[recipe.userId];
        if (author != null) {
          // 원본 Recipe 객체를 복사하여 author 정보만 업데이트합니다.
          return Recipe(
            id: recipe.id,
            imageUrl: recipe.imageUrl,
            recipeName: recipe.recipeName,
            userId: recipe.userId,
            author: author,
            rating: recipe.rating,
            cookingTime: recipe.cookingTime,
            ingredients: recipe.ingredients,
            procedures: recipe.procedures,
            isBookmarked: recipe.isBookmarked,
          );
        }
        return recipe; // 일치하는 사용자가 없으면 원본 레시피 반환
      }).toList();

      final featured = recipesWithAuthors.where((r) => r.rating! >= 1).toList();
      final newRecipes = recipesWithAuthors
          .where((r) => r.rating! < 1)
          .toList();

      _state = _state.copyWith(
        isLoading: false,
        featuredRecipes: featured,
        newRecipes: newRecipes,
      );
    } catch (e) {
      _state = _state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }
}

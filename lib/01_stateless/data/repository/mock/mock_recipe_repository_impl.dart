import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    // return Result.error('Failed to fetch recipes');

    await Future.delayed(Duration(seconds: 2));
    return Result.success([
      Recipe(
        category: '한식',
        id: 101,
        name: '김치찌개',
        imageUrl: 'https://example.com/kimchijjigae.jpg',
        chef: '김셰프',
        time: '30분',
        createdAt: DateTime.now(),
        rating: 4.5,
      ),
      Recipe(
        category: '양식',
        id: 102,
        name: '스테이크',
        imageUrl: 'https://example.com/steak.jpg',
        chef: '박셰프',
        time: '45분',
        createdAt: DateTime.now().subtract(Duration(days: 2)),
        rating: 4.8,
      ),
      Recipe(
        category: '일식',
        id: 103,
        name: '초밥',
        imageUrl: 'https://example.com/sushi.jpg',
        chef: '이셰프',
        time: '20분',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        rating: 4.2,
      ),
      Recipe(
        category: '일식',
        id: 103,
        name: '김밥',
        imageUrl: 'https://example.com/sushi.jpg',
        chef: '이셰프',
        time: '20분',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        rating: 4.2,
      ),

    ]);
  }
}

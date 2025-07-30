import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterHomeRecipeCategoryUseCase', () {
    late FilterHomeRecipeCategoryUseCase useCase;
    late List<Recipe> recipes;

    setUp(() {
      useCase = FilterHomeRecipeCategoryUseCase();
      recipes = [
        const Recipe(id: '1', name: 'Pasta', category: 'Italian', creator: '', cookingTime: '', rating: 0, reviewCount: 0, serve: 0, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
        const Recipe(id: '2', name: 'Curry', category: 'Indian', creator: '', cookingTime: '', rating: 0, reviewCount: 0, serve: 0, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
        const Recipe(id: '3', name: 'Sushi', category: 'Japanese', creator: '', cookingTime: '', rating: 0, reviewCount: 0, serve: 0, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
        const Recipe(id: '4', name: 'Pizza', category: 'Italian', creator: '', cookingTime: '', rating: 0, reviewCount: 0, serve: 0, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
      ];
    });

    test(
        'Given a specific category, ' 
        'When execute is called, ' 
        'Then it should return only the recipes of that category', () {
      // Given
      const category = HomeRecipeCategory.italian;

      // When
      final result = useCase.execute(recipes: recipes, category: category);

      // Then
      expect(result.length, 2);
      expect(result.every((recipe) => recipe.category == 'Italian'), isTrue);
    });

    test(
        'Given the category is "all", ' 
        'When execute is called, ' 
        'Then it should return all recipes', () {
      // Given
      const category = HomeRecipeCategory.all;

      // When
      final result = useCase.execute(recipes: recipes, category: category);

      // Then
      expect(result, recipes);
    });

    test(
        'Given a category with no matching recipes, ' 
        'When execute is called, ' 
        'Then it should return an empty list', () {
      // Given
      const category = HomeRecipeCategory.chinese;

      // When
      final result = useCase.execute(recipes: recipes, category: category);

      // Then
      expect(result, isEmpty);
    });

    test(
        'Given an empty list of recipes, ' 
        'When execute is called, ' 
        'Then it should return an empty list', () {
      // Given
      const category = HomeRecipeCategory.italian;

      // When
      final result = useCase.execute(recipes: [], category: category);

      // Then
      expect(result, isEmpty);
    });
  });
}

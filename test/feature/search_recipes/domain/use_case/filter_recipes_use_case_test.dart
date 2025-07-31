import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterRecipesUseCase', () {
    late FilterRecipesUseCase useCase;
    late List<Recipe> originalRecipes;

    setUp(() {
      useCase = FilterRecipesUseCase();
      originalRecipes = [
        const Recipe(id: '1', name: 'Pepperoni Pizza', category: 'Dinner', creator: 'Chef A', rating: 4.5, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
        const Recipe(id: '2', name: 'Cheese Burger', category: 'Lunch', creator: 'Chef B', rating: 3.8, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
        const Recipe(id: '3', name: 'Kung Pao Chicken', category: 'Chinese', creator: 'Chef C', rating: 5.0, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
        const Recipe(id: '4', name: 'Mapo Tofu', category: 'Chinese', creator: 'Chef D', rating: 4.2, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
        const Recipe(id: '5', name: 'Caesar Salad', category: 'Vegetables', creator: 'Chef A', rating: 3.1, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
        const Recipe(id: '6', name: 'Pasta Carbonara', category: 'Dinner', creator: 'Chef A', rating: 4.8, cookingTime: '', imageUrl: '', imageWithoutBackground: '', reviewCount: 0, serve: 0, isSaved: false),
      ];
    });

    test(
        'Given a keyword, ' 
        'When execute is called, ' 
        'Then it should return recipes matching the name or creator', () {
      // Given
      const keyword = 'chef a';
      const filterState = FilterSearchState();

      // When
      final result = useCase.execute(originalRecipes, keyword, filterState);

      // Then
      expect(result.length, 3);
      expect(result.map((e) => e.id), containsAll(['1', '5', '6']));
    });

    test(
        'Given a category filter, ' 
        'When execute is called, ' 
        'Then it should return recipes matching the category', () {
      // Given
      const keyword = '';
      const filterState = FilterSearchState(filterCategory: FilterCategory.chinese);

      // When
      final result = useCase.execute(originalRecipes, keyword, filterState);

      // Then
      expect(result.length, 2);
      expect(result.map((e) => e.id), containsAll(['3', '4']));
    });

    test(
        'Given a rating filter, ' 
        'When execute is called, ' 
        'Then it should return recipes with the matching integer rating', () {
      // Given
      const keyword = '';
      const filterState = FilterSearchState(filterRate: FilterRate.four);

      // When
      final result = useCase.execute(originalRecipes, keyword, filterState);

      // Then
      expect(result.length, 3);
      expect(result.map((e) => e.id), containsAll(['1', '4', '6']));
    });

    test(
        'Given a combination of filters, ' 
        'When execute is called, ' 
        'Then it should return recipes matching all criteria', () {
      // Given
      const keyword = 'chef';
      final filterState = FilterSearchState(
        filterCategory: FilterCategory.dinner,
        filterRate: FilterRate.four,
      );

      // When
      final result = useCase.execute(originalRecipes, keyword, filterState);

      // Then
      expect(result.length, 2);
      expect(result.map((e) => e.id), containsAll(['1', '6']));
    });

    test(
        'Given an empty keyword, ' 
        'When execute is called, ' 
        'Then it should return all recipes matching other filters', () {
      // Given
      const keyword = '';
      const filterState = FilterSearchState(filterCategory: FilterCategory.lunch);

      // When
      final result = useCase.execute(originalRecipes, keyword, filterState);

      // Then
      expect(result.length, 1);
      expect(result.first.id, '2');
    });

    test(
        'Given an empty recipe list, ' 
        'When execute is called, ' 
        'Then it should return an empty list', () {
      // Given
      const keyword = 'any';
      const filterState = FilterSearchState();

      // When
      final result = useCase.execute([], keyword, filterState);

      // Then
      expect(result, isEmpty);
    });
  });
}

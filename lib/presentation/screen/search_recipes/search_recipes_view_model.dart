import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/search_recipes_state.dart';
import '../../../data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipes_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  List<Recipe> _allRecipes = [];
  bool _isLoading = false;

  List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);

  SearchRecipesState _state = SearchRecipesState.initial();
  SearchRecipesState get state => _state;

  bool get isLoading => _isLoading;

  SearchRecipesViewModel({required RecipeRepository repository})
    : _repository = repository;

  List<String> get allCategories {
    final categories = _allRecipes.map((e) => e.category).toSet().toList();
    categories.sort();
    return ['All', ...categories];
  }

  Future<void> loadRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      final fetchedRecipes = await _repository.fetchRecipes();
      _allRecipes = fetchedRecipes;

      _state = state.copyWith(
        originalRecipes: fetchedRecipes,
        filteredRecipes: fetchedRecipes,
        resultLabel: '${fetchedRecipes.length} results',
      );

    } catch (e) {
      print('Error fetching recipes: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    final filteredRecipes = state.originalRecipes
      .where(
        (e) =>
          e.name.toLowerCase().contains(query.toLowerCase()) ||
          e.chef.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();

    _state = state.copyWith(
      query: query,
      searchLabel: state.originalRecipes.length == filteredRecipes.length
        ? 'Recent Search'
        : 'Search Result',
      filteredRecipes: filteredRecipes,
      resultLabel: '${filteredRecipes.length} results',
    );
    notifyListeners();
  }
}

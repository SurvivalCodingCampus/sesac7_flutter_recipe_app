import '../../domain/model/recipe.dart';

class RecipeHomeStateHolder {
  final List<Recipe> allRecipes;
  final List<Recipe> filteredRecipes;
  final List<String> categories;
  final String selectedCategory;
  final bool isLoading;
  final String? errorMessage;


  RecipeHomeStateHolder({
    this.allRecipes = const [],
    this.filteredRecipes = const [],
    this.categories = const [],
    this.selectedCategory = 'All',
    this.isLoading = false,
    this.errorMessage,
  });


  RecipeHomeStateHolder copyWith({
    List<Recipe>? allRecipes,
    List<Recipe>? filteredRecipes,
    List<String>? categories,
    String? selectedCategory,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RecipeHomeStateHolder(
      allRecipes: allRecipes ?? this.allRecipes,
      filteredRecipes: filteredRecipes ?? this.filteredRecipes,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
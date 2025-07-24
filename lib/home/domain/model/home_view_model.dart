// lib/presentation/viewmodels/home_view_model.dart
import 'package:flutter/foundation.dart';
import '../../../core/result.dart';
import '../../../core/domain/model/recipe.dart';
import '../../../saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import '../../presentation/screen/home_state.dart';


class HomeViewModel extends ChangeNotifier {
  final FetchRecipesUseCase _fetchRecipesUseCase;

  HomeState _state = const HomeState();
  HomeState get state => _state;

  HomeViewModel({
    required FetchRecipesUseCase fetchRecipesUseCase,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {

    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _fetchRecipesUseCase.execute();
    result.when(
      success: (data) {
        _state = _state.copyWith(
          recipes: data.recipes,
          filteredRecipes: data.recipes,
        );
      },
      failure: (error) {
        print('Error fetching recipes: $error');
        _state = _state.copyWith(isLoading: false);
      },
    );

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  // 탭 클릭 시: selectedCategory + filteredRecipes만 갱신
  void selectCategory(String category) {
    final filtered = (category == 'All')
        ? state.recipes
        : state.recipes.where((r) => r.category == category).toList();

    _state = _state.copyWith(
      selectedCategory: category,
      filteredRecipes: filtered,
    );
    notifyListeners();
  }
}
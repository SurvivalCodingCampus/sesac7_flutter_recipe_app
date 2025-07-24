import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipesCategoryListUseCase _getRecipesCategoryListUseCase;

  HomeViewModel({
    required GetRecipesCategoryListUseCase getRecipesCategoryListUseCase,
  }) : _getRecipesCategoryListUseCase = getRecipesCategoryListUseCase;

  HomeState _homeState = HomeState();

  HomeState get homeState => _homeState;

  Future<void> loadCategories() async {
    final result = await _getRecipesCategoryListUseCase.execute();
    switch (result) {
      case Success<Set<String>, NetworkError>():
        _homeState = _homeState.copyWith(categories: result.data);
      case Error<Set<String>, NetworkError>():
        _homeState = _homeState.copyWith(categories: {});
    }
    notifyListeners();
  }

  void fetchCurrentSelectedCategory(String category) {
    _homeState = _homeState.copyWith(category: category);
    notifyListeners();
  }
}

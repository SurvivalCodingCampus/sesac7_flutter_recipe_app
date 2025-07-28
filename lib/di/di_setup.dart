import 'package:flutter_recipe_app/core/domain/repository/mock_recipe_repository.dart';
import 'package:get_it/get_it.dart';

import '../core/data/mock/mock_network_repository.dart';
import '../core/domain/repository/network_repository.dart';
import '../core/domain/repository/recipes_repository.dart';
import '../core/domain/use_case/check_network_status_use_case.dart';
import '../core/presentation/screen/splash_screen/splash_screen_view_model.dart';
import '../saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import '../saved_recipes/domain/use_case/unsaved_recipe_use_case.dart';
import '../saved_recipes/presentation/saved_recipes_state.dart';
import '../saved_recipes/presentation/saved_recipes_view_model.dart';
import '../search_recipes/domain/use_case/filter_recipes_use_case.dart';
import '../search_recipes/domain/use_case/search_recipes_use_case.dart';
import '../search_recipes/presentation/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // repository
  // 싱글톤으로 한번만 생성
  getIt.registerLazySingleton<RecipeRepository>(
      () => MockRecipeRepository(),
  );

  // 네트워크 비행기모드 확인
  getIt.registerLazySingleton<NetworkRepository>(
    () => MockNetworkRepository(),
  );

  // UseCase
  getIt.registerLazySingleton<FetchRecipesUseCase>(
      () => FetchRecipesUseCase(
        recipeRepository: getIt<RecipeRepository>(),
        state: SavedRecipesState(),
      ),
  );

  getIt.registerLazySingleton<SearchRecipesUseCase>(
    () => SearchRecipesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
    ),
  );

  getIt.registerLazySingleton<FilterRecipesUseCase>(
    () => FilterRecipesUseCase(),
  );

  getIt.registerLazySingleton<CheckNetworkStatusUseCase>(
    () => CheckNetworkStatusUseCase(
      networkRepository: getIt<NetworkRepository>(),
    ),
  );

  // viewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      fetchRecipesUseCase: getIt<FetchRecipesUseCase>(),
      unsaveRecipeUseCase: getIt<UnsavedRecipeUseCase>(),
    ),
  );

  getIt.registerFactory<SearchRecipesViewModel>(
      () => SearchRecipesViewModel(
        fetchRecipesUseCase: getIt<FetchRecipesUseCase>(),
        repository: getIt<RecipeRepository>(),
        searchRecipesUseCase: getIt<SearchRecipesUseCase>(),
        filterRecipesUseCase: getIt<FilterRecipesUseCase>(),
      ),
  );

  getIt.registerFactory<SplashScreenViewModel>(
    () => SplashScreenViewModel(
        checkNetworkStatusUseCase: getIt<CheckNetworkStatusUseCase>(),
    ),
  );
}
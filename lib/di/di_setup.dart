import 'package:flutter_recipe_app/core/domain/repository/mock_recipe_repository.dart';
import 'package:get_it/get_it.dart';

import '../core/domain/repository/recipes_repository.dart';
import '../saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import '../saved_recipes/domain/use_case/unsaved_recipe_use_case.dart';
import '../saved_recipes/presentation/saved_recipes_state.dart';
import '../saved_recipes/presentation/saved_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // repository
  // 싱글톤으로 한번만 생성
  getIt.registerLazySingleton<RecipeRepository>(
      () => MockRecipeRepository(),
  );

  // UseCase
  getIt.registerLazySingleton<FetchRecipesUseCase>(
      () => FetchRecipesUseCase(
        recipeRepository: getIt<RecipeRepository>(),
        state: SavedRecipesState(),
      ),
  );

  // viewModel
  getIt.registerFactory<SavedRecipesViewModel>(
      () => SavedRecipesViewModel(
        fetchRecipesUseCase: getIt<FetchRecipesUseCase>(),
        unsaveRecipeUseCase: getIt<UnsavedRecipeUseCase>(),
      ),
  );
}
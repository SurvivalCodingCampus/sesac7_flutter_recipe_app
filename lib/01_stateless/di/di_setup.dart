import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/domain/repository/person_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:get_it/get_it.dart';

import '../data/repository/mock/mock_recipe_repository_impl.dart';
import '../domain/repository/recipe_repository.dart';
import '../domain/use_case/filter_recipes_use_case.dart';
import '../domain/use_case/get_recipe_use_case.dart';
import '../domain/use_case/search_recipes_use_case.dart';
import '../presentation/screen/ingredient/ingredient_view_model.dart';
import '../presentation/screen/main/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Repository
  getIt.registerLazySingleton<RecipeRepository>(
    () => MockRecipeRepositoryImpl(),
  );
  getIt.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(),
  );

  // UseCase
  // getIt.registerLazySingleton<GetRecipesUseCase>(
  //   () => GetRecipesUseCase(recipeRepository: getIt()),
  // );
  getIt.registerLazySingleton<GetRecipeUseCase>(
    () => GetRecipeUseCase(recipeRepository: getIt()),
  );

  getIt.registerLazySingleton<FilterRecipesUseCase>(
    () => FilterRecipesUseCase(),
  );
  getIt.registerLazySingleton<SearchRecipesUseCase>(
    () => SearchRecipesUseCase(filterRecipesUseCase: getIt()),
  );

  // ViewModel : Factory
  getIt.registerFactory(
    () => MainViewModel(personRepository: getIt()),
  );
  getIt.registerFactory(
    () => IngredientViewModel(getRecipeUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SavedRecipesViewModel(fetchRecipesUseCase: getIt()),
  );
  // getIt.registerFactory(
  //   () => SearchRecipesViewModel(
  //     getRecipesUseCase: getIt(),
  //     searchRecipesUseCase: getIt(),
  //   ),
  // );
}

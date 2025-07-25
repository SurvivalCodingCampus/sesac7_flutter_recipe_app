import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/core/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_view_model.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_ingredient_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/repository/mock/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetUp() {
  // Data Source
  getIt.registerLazySingleton<RecipeDataSource>(
    () => RecipeDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerLazySingleton<BookmarkRepository>(
    () => MockBookmarkRepositoryImpl(),
  );
  getIt.registerLazySingleton<IngredientRepository>(
    () => MockIngredientRepositoryImpl(),
  );
  getIt.registerLazySingleton<ProcedureRepository>(
    () => MockProcedureRepositoryImpl(),
  );

  // Use Case
  getIt.registerLazySingleton(
    () => GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => FetchAllRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchRecipeUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchAllIngredientsUseCase(ingredientRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchProcedureUseCase(procedureRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FormatReviewCountUseCase(),
  );
  getIt.registerLazySingleton(
    () => FilterHomeRecipeCategoryUseCase(),
  );

  // View Model
  getIt.registerFactory(
    () => HomeViewModel(
      fetchAllRecipesUseCase: getIt(),
      filterHomeRecipeCategoryUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => IngredientViewModel(
      fetchRecipeUseCase: getIt(),
      fetchAllIngredientsUseCase: getIt(),
      fetchProcedureUseCase: getIt(),
      formatReviewCountUseCase: getIt(),
    ),
  );
}

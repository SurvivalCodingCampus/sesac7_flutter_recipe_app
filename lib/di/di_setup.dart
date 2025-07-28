import 'package:flutter_recipe_app/core/system_settings/domain/repository/mock_system_settings_repository.dart';
import 'package:flutter_recipe_app/features/home/presentation/screen/home_screen_view_model.dart';
import 'package:get_it/get_it.dart';

import '../core/data/recipe/data_source/mock_recipe_data_source_impl.dart';
import '../core/data/recipe/data_source/recipe_data_source.dart';
import '../core/data/recipe/domain/repository/recipe_repository.dart';
import '../core/data/recipe/repository_impl/mock_recipe_repository_impl.dart';
import '../core/system_settings/repository_impl/mock_system_settings_repository_impl.dart';
import '../data/bookmark/data_source/bookmark_data_source.dart';
import '../data/bookmark/data_source/mock_bookmark_data_source_impl.dart';
import '../data/bookmark/domain/repository/bookmark_repository.dart';
import '../data/bookmark/repository_impl/mock_bookmark_repository_impl.dart';
import '../data/procedure/data_source/mock_procedure_data_source_impl.dart';
import '../data/procedure/data_source/procedure_data_source.dart';
import '../data/procedure/domain/repository/procedure_repository.dart';
import '../data/procedure/repository_impl/mock_procedure_repository_impl.dart';
import '../features/search_recipes/data/domain/use_case/fetch_recipes_use_case.dart';
import '../features/search_recipes/data/domain/use_case/filter_recipes_use_case.dart';
import '../features/search_recipes/data/domain/use_case/search_recipes_use_case.dart';
import '../features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart';
import '../features/show_ingredients/data/domain/use_case/fetch_procedure_by_id_use_case.dart';
import '../features/show_ingredients/data/domain/use_case/fetch_recipe_by_id_use_case.dart';
import '../features/show_ingredients/presentation/screen/ingredient_screen_view_model.dart';
import '../features/show_saved_recipes/presentation/screen/saved_recipes_view_model.dart';
import '../features/splash/data/domain/use_case/fetch_system_settings_use_case.dart';
import '../features/splash/presentation/screen/splash_screen_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // DataSource
  getIt.registerLazySingleton<RecipeDataSource>(
    () => MockRecipeDataSourceImpl(),
  );
  getIt.registerLazySingleton<BookmarkDataSource>(
    () => MockBookmarkDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProcedureDataSource>(
    () => MockProcedureDataSourceImpl(),
  );

  // UseCase
  getIt.registerLazySingleton<FetchRecipesUseCase>(
    () => FetchRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<SearchRecipesUseCase>(
    () => SearchRecipesUseCase(),
  );
  getIt.registerLazySingleton<FilterRecipesUseCase>(
    () => FilterRecipesUseCase(),
  );
  getIt.registerLazySingleton<FetchRecipeByIdUseCase>(
    () => FetchRecipeByIdUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<FetchProcedureByIdUseCase>(
    () => FetchProcedureByIdUseCase(procedureRepository: getIt()),
  );
  getIt.registerLazySingleton<FetchSystemSettingsUseCase>(
    () => FetchSystemSettingsUseCase(systemSettingsRepository: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<RecipeRepository>(
    () => MockRecipeRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<BookmarkRepository>(
    () => MockBookmarkRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<ProcedureRepository>(
    () => MockProcedureRepositoryImpl(procedureDataSource: getIt()),
  );
  getIt.registerLazySingleton<MockSystemSettingsRepository>(
    () => MockSystemSettingsRepositoryImpl(),
  );

  // ViewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      bookmarkRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );
  getIt.registerFactory<IngredientScreenViewModel>(
    () => IngredientScreenViewModel(
      fetchProcedureByIdUseCase: getIt(),
      fetchRecipeByIdUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchRecipesScreenViewModel>(
    () => SearchRecipesScreenViewModel(
      fetchRecipesUseCase: getIt(),
      filterRecipesUseCase: getIt(),
      searchRecipesUseCase: getIt(),
    ),
  );
  getIt.registerFactory<HomeScreenViewModel>(
    () => HomeScreenViewModel(recipeRepository: getIt()),
  );
  getIt.registerFactory<SplashScreenViewModel>(
    () => SplashScreenViewModel(fetchSystemSettingsUseCase: getIt()),
  );
}

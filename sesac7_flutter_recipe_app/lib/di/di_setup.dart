import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_recipe_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_system_settings_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repoisitory.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_view_model.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetUp() {
  // DataSource
  getIt.registerLazySingleton<RecipeDataSource>(() => RecipeDataSourceImpl());

  // Repository
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerLazySingleton<ProcedureRepository>(
    () => MockProcedureRepositoryImpl(),
  );
  getIt.registerLazySingleton<BookmarkRepository>(
    () => MockBookMarkRepositoryImpl(),
  );
  getIt.registerLazySingleton<SystemSettingsRepository>(
    () => MockSystemSettingsRepositoryImpl(),
  );

  // UseCase
  getIt.registerLazySingleton<GetRecipesUseCase>(
    () => GetRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<GetRecipesCategoryListUseCase>(
    () => GetRecipesCategoryListUseCase(getRecipesUseCase: getIt()),
  );
  getIt.registerLazySingleton<GetRecipesByCategory>(
    () => GetRecipesByCategory(getRecipesUseCase: getIt()),
  );
  getIt.registerLazySingleton<GetSavedRecipesUseCase>(
    () => GetSavedRecipesUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton<RemoveSavedRecipeUseCase>(
    () => RemoveSavedRecipeUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton<GetSavedRecipeFindByIdUseCase>(
    () => GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: getIt()),
  );
  getIt.registerLazySingleton<GetProceduresByRecipeIdUseCase>(
    () => GetProceduresByRecipeIdUseCase(procedureRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAirplaneModeActivateUseCase>(
    () => GetAirplaneModeActivateUseCase(systemSettingsRepository: getIt()),
  );

  // ViewModel
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getRecipesUseCase: getIt(),
      getRecipesCategoryListUseCase: getIt(),
      getRecipesByCategory: getIt(),
    ),
  );
  getIt.registerFactory<SavedRecipeViewModel>(
    () => SavedRecipeViewModel(
      getSavedRecipesUseCase: getIt(),
      removeSavedRecipeUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(recipeRepository: getIt()),
  );
  getIt.registerFactory<IngredientViewModel>(
    () => IngredientViewModel(
      getSavedRecipeFindByIdUseCase: getIt(),
      getProceduresByRecipeIdUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(
      getAirplaneModeActivateUseCase: getIt(),
    ),
  );
}

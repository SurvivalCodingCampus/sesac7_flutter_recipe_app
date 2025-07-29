import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_recipe_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_system_settings_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repository.dart';
import 'package:flutter_recipe_app/domain/usecase/add_recent_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/add_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recent_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_ids_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_filter_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_keyword_use_case.dart';
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
    () => MockRecipeRepositoryImpl(recipeDataSource: getIt()),
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
    () => GetSavedRecipesUseCase(
      bookmarkRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<RemoveSavedRecipeUseCase>(
    () => RemoveSavedRecipeUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton<AddSavedRecipeUseCase>(
    () => AddSavedRecipeUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton<GetSavedRecipeIdsUseCase>(
    () => GetSavedRecipeIdsUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton<GetBookmarkChangedStreamUseCase>(
    () => GetBookmarkChangedStreamUseCase(bookmarkRepository: getIt()),
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
  getIt.registerLazySingleton<SearchRecipeByKeywordUseCase>(
    () => SearchRecipeByKeywordUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<SearchRecipeByFilterUseCase>(
    () => SearchRecipeByFilterUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<GetRecentRecipesUseCase>(
    () => GetRecentRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton<AddRecentRecipesUseCase>(
    () => AddRecentRecipesUseCase(recipeRepository: getIt()),
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
    () => SearchRecipesViewModel(
      searchRecipeByKeywordUseCase: getIt(),
      searchRecipeByFilterUseCase: getIt(),
      getRecentRecipesUseCase: getIt(),
      addRecentRecipesUseCase: getIt(),
    ),
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

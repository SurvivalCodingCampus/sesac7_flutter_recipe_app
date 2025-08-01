import 'dart:async';

import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/core/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/remove_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/save_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_view_model.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_ingredient_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/bookmark_data_source.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/bookmark_db_helper.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/local_bookmark_data_source_impl.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/repository/bookmark_repository_impl.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source_impl.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/recent_search_keyword_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/recent_search_keyword_data_source_impl.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/repository/filter_search_state_repository_impl.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/repository/recent_search_keyword_repository_impl.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/feature/splash/data/repository/mock_system_controls_repository_impl.dart';
import 'package:flutter_recipe_app/feature/splash/domain/repository/system_controls_repository.dart';
import 'package:flutter_recipe_app/feature/splash/domain/use_case/is_airplane_mode_use_case.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;
const hiveDatabaseName = 'Hive';

Future<void> diSetUp() async {
  final boxCollection = await _hiveSetUp();
  final sqfliteDb = await _sqfliteSetUp();

  // DB
  getIt.registerLazySingleton<SharedPreferencesAsync>(
    () => SharedPreferencesAsync(),
  );
  getIt.registerLazySingleton<BoxCollection>(
    () => boxCollection,
  );
  getIt.registerLazySingleton<Database>(
    () => sqfliteDb,
  );

  // Data Source
  getIt.registerLazySingleton<RecipeDataSource>(
    () => RecipeDataSourceImpl(),
  );
  getIt.registerLazySingleton<RecentSearchKeywordDataSource>(
    () => RecentSearchKeywordDataSourceImpl(
      sharedPreferencesAsync: getIt(),
    ),
  );
  getIt.registerLazySingleton<FilterSearchStateDataSource>(
    () => FilterSearchStateDataSourceImpl(boxCollection: boxCollection),
  );
  getIt.registerLazySingleton<BookmarkDataSource>(
    () => LocalBookmarkDataSourceImpl(db: sqfliteDb),
  );

  // Repository
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(localBookmarkDataSource: getIt()),
  );
  getIt.registerLazySingleton<IngredientRepository>(
    () => MockIngredientRepositoryImpl(),
  );
  getIt.registerLazySingleton<ProcedureRepository>(
    () => MockProcedureRepositoryImpl(),
  );
  getIt.registerLazySingleton<SystemControlsRepository>(
    () => MockSystemControlsRepositoryImpl(),
  );
  getIt.registerLazySingleton<RecentSearchKeywordRepository>(
    () => RecentSearchKeywordRepositoryImpl(
      recentSearchKeywordDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<FilterSearchStateRepository>(
    () => FilterSearchStateRepositoryImpl(filterSearchStateDataSource: getIt()),
  );

  // Use Case
  getIt.registerLazySingleton(
    () => GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetAllRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetRecipeUseCase(recipeRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetAllIngredientsUseCase(ingredientRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetProcedureUseCase(procedureRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FormatReviewCountUseCase(),
  );
  getIt.registerLazySingleton(
    () => FilterHomeRecipeCategoryUseCase(),
  );
  getIt.registerLazySingleton(
    () => RemoveSavedRecipeUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => FilterRecipesUseCase(),
  );
  getIt.registerLazySingleton(
    () => IsAirplaneModeUseCase(systemControlsRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetRecentSearchKeywordUseCase(searchHistoryRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => SaveSearchKeywordUseCase(searchHistoryRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => SaveBookmarkUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => RemoveBookmarkUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetFilterSearchStateUseCase(filterSearchStateRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => SaveFilterSearchStateUseCase(filterSearchStateRepository: getIt()),
  );

  // View Model
  getIt.registerFactory(
    () => HomeViewModel(
      fetchAllRecipesUseCase: getIt(),
      filterHomeRecipeCategoryUseCase: getIt(),
      getSavedRecipesUseCase: getIt(),
      removeBookmarkUseCase: getIt(),
      saveBookmarkUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      removeSavedRecipeUseCase: getIt(),
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
  getIt.registerFactory(
    () => SplashViewModel(isAirplaneModeUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SearchRecipesViewModel(
      getAllRecipesUseCase: getIt(),
      filterRecipesUseCase: getIt(),
      getRecentSearchKeywordUseCase: getIt(),
      saveSearchKeywordUseCase: getIt(),
      debouncer: Debouncer(delay: Duration(milliseconds: 500)),
      getFilterSearchStateUseCase: getIt(),
      saveFilterSearchStateUseCase: getIt(),
    ),
  );
}

Future<BoxCollection> _hiveSetUp() async {
  try {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final hivePath = appDocumentDirectory.path;
    final boxCollection = await BoxCollection.open(
      hiveDatabaseName,
      {FilterSearchStateDataSourceImpl.boxName},
      path: hivePath,
    );
    return boxCollection;
  } catch (e) {
    // TODO: 대체 처리?, 로깅
    rethrow;
  }
}

Future<Database> _sqfliteSetUp() async {
  try {
    return await BookmarkDbHelper().database;
  } catch (e) {
    // TODO: 대체 처리?, 로깅
    rethrow;
  }
}

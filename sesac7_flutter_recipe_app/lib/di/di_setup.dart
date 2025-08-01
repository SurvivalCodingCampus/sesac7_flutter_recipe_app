import 'package:flutter_recipe_app/data/data_source/local/db/dao/user_dao.dart';
import 'package:flutter_recipe_app/data/data_source/local/db/dao/user_dao_impl.dart';
import 'package:flutter_recipe_app/data/data_source/local/db/database_helper.dart';
import 'package:flutter_recipe_app/data/data_source/local/local_search_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/local/local_search_data_source_impl.dart';
import 'package:flutter_recipe_app/data/data_source/remote/remote_recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_recipe_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_system_settings_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/search_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/user_repository_impl.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/domain/repository/search_repository.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repository.dart';
import 'package:flutter_recipe_app/domain/repository/user_repository.dart';
import 'package:flutter_recipe_app/domain/usecase/add_saved_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/delete_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recent_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_user_saved_recipe_ids_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_user_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/save_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_filter_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_keyword_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_view_model.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/usecase/add_user_use_case.dart';

final getIt = GetIt.instance;

Future<void> diSetUp() async {
  final database = await DatabaseHelper().database;

  // DB
  getIt.registerLazySingleton<Database>(() => database);

  // Dao
  getIt.registerLazySingleton<UserDao>(() => UserDaoImpl(getIt()));

  // DataSource
  getIt.registerLazySingleton<RemoteRecipeDataSource>(
    () => RemoteRecipeDataSourceImpl(),
  );
  getIt.registerLazySingleton<LocalSearchDataSource>(
    () => LocalSearchDataSourceImpl(),
  );

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
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(localSearchDataSource: getIt()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userDao: getIt()),
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
      recipeRepository: getIt(),
      getUserSavedRecipeIdsUseCase: getIt(),
    ),
  );
  // getIt.registerLazySingleton<RemoveSavedRecipeUseCase>(
  //       () => RemoveSavedRecipeUseCase(bookmarkRepository: getIt()),
  // );
  // getIt.registerLazySingleton<AddSavedRecipeUseCase>(
  //       () => AddSavedRecipeUseCase(bookmarkRepository: getIt()),
  // );
  // getIt.registerLazySingleton<GetSavedRecipeIdsUseCase>(
  //   () => GetSavedRecipeIdsUseCase(bookmarkRepository: getIt()),
  // );
  getIt.registerLazySingleton<AddSavedRecipeIdUseCase>(
    () => AddSavedRecipeIdUseCase(userRepository: getIt()),
  );
  getIt.registerLazySingleton<GetUserSavedRecipeIdsUseCase>(
    () => GetUserSavedRecipeIdsUseCase(userUseCase: getIt()),
  );
  getIt.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(userRepository: getIt()),
  );
  getIt.registerLazySingleton<RemoveSavedRecipeIdUseCase>(
    () => RemoveSavedRecipeIdUseCase(userRepository: getIt()),
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
    () => GetRecentRecipesUseCase(
      recipeRepository: getIt(),
      searchRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<DeleteRecentSearchKeywordUseCase>(
    () => DeleteRecentSearchKeywordUseCase(searchRepository: getIt()),
  );
  getIt.registerLazySingleton<GetRecentSearchKeywordUseCase>(
    () => GetRecentSearchKeywordUseCase(searchRepository: getIt()),
  );
  getIt.registerLazySingleton<SaveRecentSearchKeywordUseCase>(
    () => SaveRecentSearchKeywordUseCase(searchRepository: getIt()),
  );
  getIt.registerLazySingleton<AddUserUseCase>(
    () => AddUserUseCase(userRepository: getIt()),
  );

  // ViewModel
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getRecipesUseCase: getIt(),
      getRecipesCategoryListUseCase: getIt(),
      getRecipesByCategory: getIt(),
      getSavedRecipeFindByIdUseCase: getIt(),
      getUserSavedRecipeIdsUseCase: getIt(),
      bookmarkChangedStreamUseCase: getIt(),
      removeSavedRecipeIdUseCase: getIt(),
      addSavedRecipeIdUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SavedRecipeViewModel>(
    () => SavedRecipeViewModel(
      getSavedRecipesUseCase: getIt(),
      removeSavedRecipeUseCase: getIt(),
      getBookmarkChangedStreamUseCase: getIt(),
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
      addUserUseCase: getIt(),
    ),
  );
}

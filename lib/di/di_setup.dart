import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/home_screen_view_model.dart';
import 'package:get_it/get_it.dart';

import '../data/data_source/bookmark_data_source.dart';
import '../data/data_source/mock_bookmark_data_source_impl.dart';
import '../data/data_source/mock_procedure_data_source_impl.dart';
import '../data/data_source/mock_recipe_data_source_impl.dart';
import '../data/data_source/procedure_data_source.dart';
import '../data/data_source/recipe_data_source.dart';
import '../data/repository/bookmark_repository.dart';
import '../data/repository/mock_procedure_repository_impl.dart';
import '../data/repository/mock_recipe_repository_impl.dart';
import '../data/repository/procedure_repository.dart';
import '../data/repository/recipe_repository.dart';
import '../presentation/screen/ingredient_screen_view_model.dart';
import '../presentation/screen/saved_recipes_view_model.dart';
import '../presentation/screen/search_recipes_screen_view_model.dart';

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

  // ViewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      bookmarkRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );
  getIt.registerFactory<IngredientScreenViewModel>(
    () => IngredientScreenViewModel(
      recipeRepository: getIt(),
      procedureRepository: getIt(),
    ),
  );
  getIt.registerFactory<SearchRecipesScreenViewModel>(
    () => SearchRecipesScreenViewModel(recipeRepository: getIt()),
  );
  getIt.registerFactory<HomeScreenViewModel>(
    () => HomeScreenViewModel(recipeRepository: getIt()),
  );
}

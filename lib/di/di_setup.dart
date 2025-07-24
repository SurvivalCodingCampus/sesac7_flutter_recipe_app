import 'package:flutter_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipe_detail_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_source/recipe_data_source.dart';
import '../../data/repository/ingredient_repository_impl.dart';
import '../../domain/repository/ingredient_repository.dart';
import '../../domain/repository/recipe_repository.dart';
import '../../domain/use_case/get_recipe_by_recipe_id.dart';
import '../../domain/use_case/get_recipes_remove_by_recipe_id.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/view_model/recipe_view_model.dart';
import '../data/data_source/mock_recipe_data_source_impl.dart';
import '../data/repository/procedure_repository_impl.dart';
import '../domain/repository/procedure_repository.dart';
import '../domain/use_case/get_home_recipe_use_case.dart';
import '../domain/use_case/get_ingrident_use_case.dart';
import '../domain/use_case/get_procedure_use_case.dart';
import '../presentation/view_model/recipe_detail_view_model.dart';
import '../presentation/view_model/recipe_home_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerLazySingleton<RecipeDataSource>(() => MockRecipeDataSource());
  getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(getIt()));

  getIt.registerLazySingleton<GetSavedRecipesUseCase>(
    () => GetSavedRecipesUseCase(recipeRepository: getIt()),
  );

  getIt.registerLazySingleton<GetRecipesRemoveByRecipeId>(
      () => GetRecipesRemoveByRecipeId()
  );

  getIt.registerLazySingleton<GetRecipeByRecipeId>(
      () => GetRecipeByRecipeId()
  );

  getIt.registerFactory<RecipeViewModel>(
    () => RecipeViewModel(
      getSavedRecipesUseCase: getIt(),
      getRecipesRemoveByRecipeId: getIt(),
      getRecipeByRecipeId: getIt(),
    ),
  );

  getIt.registerLazySingleton<IngredientRepository>(
          () => IngredientRepositoryImpl(recipeDataSource: getIt())
  );

  getIt.registerLazySingleton<GetIngredientsUseCase>(
          () => GetIngredientsUseCase(ingredientRepository: getIt())
  );

  getIt.registerLazySingleton<ProcedureRepository>(
      () => ProcedureRepositoryImpl(recipeDataSource: getIt())
  );

  getIt.registerLazySingleton<GetProcedureUseCase>(
      () => GetProcedureUseCase(procedureRepository: getIt())
  );

  getIt.registerLazySingleton<GetRecipeDetailUseCase>(
      () => GetRecipeDetailUseCase(recipeRepository: getIt())
  );

  getIt.registerFactory<RecipeDetailViewModel>(
      () => RecipeDetailViewModel(
        //getIngredientsUseCase: getIt(),
        //getProcedureUseCase: getIt(),
        getRecipeDetailUseCase: getIt(),
      )
  );

  getIt.registerLazySingleton<GetHomeRecipeUseCase>(
      () => GetHomeRecipeUseCase(recipeRepository: getIt())
  );
  
  getIt.registerFactory<RecipeHomeViewModel>(
      () => RecipeHomeViewModel(
        getHomeRecipeUseCase: getIt(),
      )
  );
}
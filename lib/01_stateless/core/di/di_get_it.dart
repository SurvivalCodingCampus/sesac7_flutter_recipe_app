import 'package:flutter_recipe_app/01_stateless/data/repository/bookmark_recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_bookmark_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_recipe_detail_fragment_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_user_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_detail_fragment_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/user_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipe_detail_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipes_by_category_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerLazySingleton<RecipeRepository>(
      () => MockRecipeRepositoryImpl(),
  );
  getIt.registerLazySingleton<UserRepository>(
      () => MockUserRepositoryImpl(),
  );
  getIt.registerLazySingleton<RecipeDetailFragmentRepository>(
      () => MockRecipeDetailRepositoryImpl(),
  );
  getIt.registerLazySingleton<BookmarkRecipeRepository>(
      () => MockBookmarkRecipeRepositoryImpl(),
  );
  
  getIt.registerLazySingleton<GetRecipeDetailByIdUseCase>(
      () => GetRecipeDetailByIdUseCase(
          userRepository: getIt(),
          recipeRepository: getIt(),
          recipeDetailFragmentRepository: getIt()
      ),
  );

  getIt.registerLazySingleton<GetRecipeByCategoryUseCase>(
      () => GetRecipeByCategoryUseCase(
          recipeRepository: getIt(),
      )
  );

  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(
          getRecipeByCategoryUseCase: getIt(),
      )
  );

  getIt.registerFactory<SavedRecipesViewModel>(
      () => SavedRecipesViewModel(repo: getIt())
  );

  getIt.registerFactory<RecipeDetailViewModel>(
      () => RecipeDetailViewModel(
          getRecipeDetailByIdUseCase: getIt()
      ),
  );



}
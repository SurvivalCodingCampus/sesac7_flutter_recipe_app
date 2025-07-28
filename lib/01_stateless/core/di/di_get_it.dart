import 'package:flutter_recipe_app/01_stateless/data/repository/mock_recipe_detail_fragment_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_user_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_detail_fragment_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/user_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/bookmark_recipe_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_bookmarked_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipe_detail_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipes_by_category_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/is_bookmarked_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/unbookmark_recipe_by_id_use_case.dart';
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

  // usecases

  getIt.registerLazySingleton<BookmarkRecipeByIdUseCase>(
    () => BookmarkRecipeByIdUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetBookmarkedRecipesUseCase>(
    () => GetBookmarkedRecipesUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetRecipeDetailByIdUseCase>(
    () => GetRecipeDetailByIdUseCase(
      userRepository: getIt(),
      recipeRepository: getIt(),
      recipeDetailFragmentRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetRecipeByCategoryUseCase>(
    () => GetRecipeByCategoryUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<IsBookmarkedByIdUseCase>(
    () => IsBookmarkedByIdUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<UnbookmarkRecipeByIdUseCase>(
    () => UnbookmarkRecipeByIdUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerFactory<MainViewModel>(
    () => MainViewModel(
      getRecipeByCategoryUseCase: getIt(),
      bookmarkRecipeByIdUseCase: getIt(),
      unBookmarkRecipeByIdUseCase: getIt(),
      isBookmarkedByIdUseCase: getIt(),
    ),
  );

  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getBookmarkedRecipesUseCase: getIt(),
      bookmarkRecipeByIdUseCase: getIt(),
      unbookmarkRecipeByIdUseCase: getIt(),
    ),
  );

  getIt.registerFactory<RecipeDetailViewModel>(
    () => RecipeDetailViewModel(getRecipeDetailByIdUseCase: getIt()),
  );
}

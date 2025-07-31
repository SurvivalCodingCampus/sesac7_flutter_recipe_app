import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/model/ingredient_tab_type.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_action.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_event.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ingredient_view_model_test.mocks.dart';

@GenerateMocks([
  GetRecipeUseCase,
  GetAllIngredientsUseCase,
  GetProcedureUseCase,
])
void main() {
  provideDummy<Result<Recipe, NetworkError>>(
    const Result.success(Recipe.empty),
  );
  provideDummy<Result<List<Ingredient>, NetworkError>>(
    const Result.success([]),
  );
  provideDummy<Result<List<String>, NetworkError>>(const Result.success([]));

  group('IngredientViewModel', () {
    late IngredientViewModel viewModel;
    late MockGetRecipeUseCase mockGetRecipeUseCase;
    late MockGetAllIngredientsUseCase mockGetAllIngredientsUseCase;
    late MockGetProcedureUseCase mockGetProcedureUseCase;
    late FormatReviewCountUseCase formatReviewCountUseCase;

    setUp(() {
      mockGetRecipeUseCase = MockGetRecipeUseCase();
      mockGetAllIngredientsUseCase = MockGetAllIngredientsUseCase();
      mockGetProcedureUseCase = MockGetProcedureUseCase();
      formatReviewCountUseCase = FormatReviewCountUseCase();

      viewModel = IngredientViewModel(
        fetchRecipeUseCase: mockGetRecipeUseCase,
        fetchAllIngredientsUseCase: mockGetAllIngredientsUseCase,
        fetchProcedureUseCase: mockGetProcedureUseCase,
        formatReviewCountUseCase: formatReviewCountUseCase,
      );
    });

    const recipeId = '1';
    const mockRecipe = Recipe(
      id: '1',
      name: 'Test Recipe',
      reviewCount: 1234,
      category: '',
      creator: '',
      cookingTime: '',
      rating: 0,
      serve: 0,
      isSaved: false,
      imageUrl: '',
      imageWithoutBackground: '',
    );
    final mockIngredients = [
      const Ingredient(id: '1', name: 'Flour', imageUrl: '', weight: 500),
    ];
    final mockProcedure = ['Step 1'];

    test('Given all use cases succeed, '
        'When init is called, '
        'Then it should update the state with all fetched data', () async {
      // Given
      when(
        mockGetRecipeUseCase.execute(any),
      ).thenAnswer((_) async => Result.success(mockRecipe));
      when(
        mockGetAllIngredientsUseCase.execute(any),
      ).thenAnswer((_) async => Result.success(mockIngredients));
      when(
        mockGetProcedureUseCase.execute(any),
      ).thenAnswer((_) async => Result.success(mockProcedure));

      // When
      await viewModel.init(recipeId: recipeId);

      // Then
      expect(viewModel.state.isLoading, isFalse);
      expect(viewModel.state.recipe, mockRecipe);
      expect(viewModel.state.ingredients, mockIngredients);
      expect(viewModel.state.procedure, mockProcedure);
      expect(viewModel.state.reviewCount, '1.23K');
      verify(mockGetRecipeUseCase.execute(recipeId)).called(1);
      verify(mockGetAllIngredientsUseCase.execute(recipeId)).called(1);
      verify(mockGetProcedureUseCase.execute(recipeId)).called(1);
    });

    void testInitFailure({
      required bool recipeFails,
      required bool ingredientsFail,
      required bool procedureFails,
    }) {
      final failingPart = recipeFails
          ? 'recipe'
          : (ingredientsFail ? 'ingredients' : 'procedure');
      test('Given fetching $failingPart fails, '
          'When init is called, '
          'Then it should emit an error event', () async {
        // Given
        when(mockGetRecipeUseCase.execute(any)).thenAnswer(
          (_) async => recipeFails
              ? const Result.error(NetworkError.serverError)
              : Result.success(mockRecipe),
        );
        when(mockGetAllIngredientsUseCase.execute(any)).thenAnswer(
          (_) async => ingredientsFail
              ? const Result.error(NetworkError.serverError)
              : Result.success(mockIngredients),
        );
        when(mockGetProcedureUseCase.execute(any)).thenAnswer(
          (_) async => procedureFails
              ? const Result.error(NetworkError.serverError)
              : Result.success(mockProcedure),
        );

        // Then
        expectLater(viewModel.eventStream, emits(isA<ShowErrorDialog>()));

        // When
        await viewModel.init(recipeId: recipeId);

        // Then
        expect(viewModel.state.isLoading, isFalse);
      });
    }

    testInitFailure(
      recipeFails: true,
      ingredientsFail: false,
      procedureFails: false,
    );
    testInitFailure(
      recipeFails: false,
      ingredientsFail: true,
      procedureFails: false,
    );
    testInitFailure(
      recipeFails: false,
      ingredientsFail: false,
      procedureFails: true,
    );

    test('Given a tab index, '
        'When onAction(ChangeTab) is called, '
        'Then it should update the tab type in the state', () {
      // When
      viewModel.onAction(const IngredientAction.changeTab(1));

      // Then
      expect(viewModel.state.tabType, IngredientTabType.procedure);

      // When
      viewModel.onAction(const IngredientAction.changeTab(0));

      // Then
      expect(viewModel.state.tabType, IngredientTabType.ingredient);
    });
  });
}

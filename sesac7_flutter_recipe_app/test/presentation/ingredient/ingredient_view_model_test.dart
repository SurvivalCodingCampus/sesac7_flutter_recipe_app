
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_procedure_repository.dart';
import '../../mock/mock_get_saved_recipes_use_case.dart';

void main() {
  group('IngredientViewModel', () {
    late IngredientViewModel viewModel;
    late MockGetSavedRecipesUseCase mockGetSavedRecipesUseCase;
    late MockProcedureRepository mockProcedureRepository;

    final testRecipe = Recipe(
        id: 1,
        name: 'Test Recipe',
        image: 'test.jpg',
        category: 'Test',
        chef: 'Chef',
        time: '10min',
        rating: 4.0,
        ingredients: []);

    final testProcedures = [
      Procedure(recipeId: 1, step: 1, content: 'Step 1'),
      Procedure(recipeId: 1, step: 2, content: 'Step 2'),
    ];

    setUp(() {
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(Result.success([testRecipe]));
      mockProcedureRepository = MockProcedureRepository(getProceduresResult: Success(testProcedures));

      viewModel = IngredientViewModel(
        getSavedRecipeFindByIdUseCase: GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase),
        getProceduresByRecipeIdUseCase: GetProceduresByRecipeIdUseCase(procedureRepository: mockProcedureRepository),
      );
    });

    test('fetchCurrentSelectedRecipe should update currentSelectedRecipe in state', () async {
      await viewModel.fetchCurrentSelectedRecipe(1);
      expect(viewModel.value.currentSelectedRecipe, testRecipe);
    });

    test('fetchCurrentSelectedRecipe should set currentSelectedRecipe to null on error', () async {
      mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(const Result.error('error'));
      viewModel = IngredientViewModel(
        getSavedRecipeFindByIdUseCase: GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase),
        getProceduresByRecipeIdUseCase: GetProceduresByRecipeIdUseCase(procedureRepository: mockProcedureRepository),
      );
      await viewModel.fetchCurrentSelectedRecipe(1);
      expect(viewModel.value.currentSelectedRecipe, isNull);
    });

    test('fetchCurrentSelectedRecipeProcedures should update procedures in state', () async {
      await viewModel.fetchCurrentSelectedRecipeProcedures(1);
      expect(viewModel.value.currentSelectedRecipeProcedures, testProcedures);
    });

    test('fetchCurrentSelectedRecipeProcedures should set procedures to empty list on error', () async {
      mockProcedureRepository = MockProcedureRepository(getProceduresResult: Error(NetworkError.unKnown));
      viewModel = IngredientViewModel(
        getSavedRecipeFindByIdUseCase: GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase),
        getProceduresByRecipeIdUseCase: GetProceduresByRecipeIdUseCase(procedureRepository: mockProcedureRepository),
      );
      await viewModel.fetchCurrentSelectedRecipeProcedures(1);
      expect(viewModel.value.currentSelectedRecipeProcedures, isEmpty);
    });

    test('changeTab should update selectedLabelIndex in state', () {
      viewModel.changeTab(1);
      expect(viewModel.value.selectedLabelIndex, 1);
    });

    test('onAction.changeIngredientTapSelectedIndex should call changeTab', () {
      viewModel.onAction(const IngredientAction.changeIngredientTapSelectedIndex(2));
      expect(viewModel.value.selectedLabelIndex, 2);
    });
  });
}

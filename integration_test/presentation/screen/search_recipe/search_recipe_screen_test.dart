import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_search_card.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Mock RecipeRepository for controlled testing.
class MockRecipeRepository implements RecipeRepository {
  Result<List<Recipe>, NetworkError> _result = const Result.success([]);

  // Method to set the desired result for the fetchAllRecipes call.
  void setResult(Result<List<Recipe>, NetworkError> result) {
    _result = result;
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> fetchAllRecipes() async {
    return _result;
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SearchRecipesViewModel viewModel;
  late MockRecipeRepository mockRecipeRepository;

  // Sample data for testing.
  final mockRecipes = [
    Recipe(
      id: '1',
      name: 'Tomato Soup',
      category: 'Cereal',
      creator: 'Chef John',
      cookingTime: '30 min',
      rating: 4.5,
      ingredients: [],
      imageUrl: '',
    ),
    Recipe(
      id: '2',
      name: 'Grilled Cheese',
      category: 'Cereal',
      creator: 'Jane Doe',
      cookingTime: '15 min',
      rating: 4.0,
      ingredients: [],
      imageUrl: '',
    ),
    Recipe(
      id: '3',
      name: 'Peking Duck',
      category: 'Chinese',
      creator: 'Chef Wang',
      cookingTime: '90 min',
      rating: 4.8,
      ingredients: [],
      imageUrl: '',
    ),
    Recipe(
      id: '4',
      name: 'Mapo Tofu',
      category: 'Chinese',
      creator: 'Chef Chen',
      cookingTime: '25 min',
      rating: 4.6,
      ingredients: [],
      imageUrl: '',
    ),
    Recipe(
      id: '5',
      name: 'Vegetable Stir-fry',
      category: 'Vegetables',
      creator: 'Jane Doe',
      cookingTime: '20 min',
      rating: 3.9,
      ingredients: [],
      imageUrl: '',
    ),
  ];

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    viewModel = SearchRecipesViewModel(recipeRepository: mockRecipeRepository);
  });

  Future<void> pumpTheScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return SearchRecipesScreen(viewModel: viewModel);
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('SearchRecipeScreen Integration Tests with Mock Repository', () {
    testWidgets('should display initial UI elements and a list of recipes', (
      WidgetTester tester,
    ) async {
      // Given: A successful result with mock data.
      mockRecipeRepository.setResult(Result.success(mockRecipes));
      viewModel.init();

      // When: The screen is rendered.
      await pumpTheScreen(tester);

      // Then: The initial UI should be correct.
      expect(find.text('Search recipes'), findsOneWidget);
      expect(find.byType(SearchField), findsOneWidget);
      expect(find.byType(SearchFilterButton), findsOneWidget);
      expect(find.text('Recent Search'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      // And the number of cards should match the mock data.
      expect(find.byType(RecipeSearchCard), findsNWidgets(mockRecipes.length));
    });

    testWidgets('should filter recipes when user types in search field', (
      WidgetTester tester,
    ) async {
      // Given: The screen is loaded with mock data.
      mockRecipeRepository.setResult(Result.success(mockRecipes));
      viewModel.init();
      await pumpTheScreen(tester);
      const keyword = 'soup';

      // When: The user types a keyword.
      await tester.enterText(find.byType(SearchField), keyword);
      await tester.pumpAndSettle();

      // Then: The UI should update with search results.
      expect(find.text('Search Result'), findsOneWidget);
      expect(find.text('1 results'), findsOneWidget);
      expect(find.byType(RecipeSearchCard), findsOneWidget);
      expect(find.text('Tomato Soup'), findsOneWidget);
    });

    testWidgets('should show zero results for a non-matching keyword', (
      WidgetTester tester,
    ) async {
      // Given: The screen is loaded with mock data.
      mockRecipeRepository.setResult(Result.success(mockRecipes));
      viewModel.init();
      await pumpTheScreen(tester);
      const keyword = 'nonexistentkeyword12345';

      // When: The user types a keyword that doesn't match any recipe.
      await tester.enterText(find.byType(SearchField), keyword);
      await tester.pumpAndSettle();

      // Then: The UI should show that no results were found.
      expect(find.text('Search Result'), findsOneWidget);
      expect(find.text('0 results'), findsOneWidget);
      expect(find.byType(RecipeSearchCard), findsNothing);
    });

    testWidgets('should filter recipes when a category filter is applied', (
      WidgetTester tester,
    ) async {
      // Given: The screen is loaded with mock data.
      mockRecipeRepository.setResult(Result.success(mockRecipes));
      viewModel.init();
      await pumpTheScreen(tester);

      // When: The user opens the filter sheet, selects a category, and applies it.
      await tester.tap(find.byType(SearchFilterButton));
      await tester.pumpAndSettle();

      final categoryToFilter = FilterCategory.chinese.toString();
      await tester.tap(find.text(categoryToFilter));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(SmallButton, 'Filter'));
      await tester.pumpAndSettle();

      // Then: The UI should update with the filtered results.
      expect(find.text('Search Result'), findsOneWidget);
      expect(find.text('2 results'), findsOneWidget);

      final cards = tester.widgetList<RecipeSearchCard>(
        find.byType(RecipeSearchCard),
      );
      expect(cards.length, 2);
      for (final card in cards) {
        expect(card.recipe.category, categoryToFilter);
      }
      expect(find.text('Peking Duck'), findsOneWidget);
      expect(find.text('Mapo Tofu'), findsOneWidget);
    });

    testWidgets('should display an error message if fetching recipes fails', (
      WidgetTester tester,
    ) async {
      // Given: A failure result from the repository.
      mockRecipeRepository.setResult(
        const Result.error(NetworkError.serverError),
      );
      viewModel.init();

      // When: The screen is rendered.
      await pumpTheScreen(tester);

      // Then: An error message should be displayed in the UI.
      expect(find.text(viewModel.state.errorMessage!), findsOneWidget);
      expect(find.byType(RecipeSearchCard), findsNothing);
    });
  });
}

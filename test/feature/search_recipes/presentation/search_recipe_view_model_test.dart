import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_recipe_view_model_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetAllRecipesUseCase>(),
  MockSpec<FilterRecipesUseCase>(),
  MockSpec<GetRecentSearchKeywordUseCase>(),
  MockSpec<SaveSearchKeywordUseCase>(),
  MockSpec<Debouncer>(),
])
void main() {
  late MockFetchAllRecipesUseCase mockFetchAllRecipesUseCase;
  late MockFilterRecipesUseCase mockFilterRecipesUseCase;
  late MockFetchRecentSearchKeywordUseCase mockFetchRecentSearchKeywordUseCase;
  late MockSaveSearchKeywordUseCase mockSaveSearchKeywordUseCase;
  late MockDebouncer mockDebouncer;
  late SearchRecipesViewModel viewModel;

  final List<Recipe> mockRecipes = [
    const Recipe(
      id: '1',
      name: 'Spicy Chicken',
      creator: 'John Doe',
      rating: 4.5,
      category: 'Dinner',
      imageUrl: '',
      imageWithoutBackground: '',
      cookingTime: '30 min',
      reviewCount: 10,
      serve: 2,
      isSaved: false,
    ),
    const Recipe(
      id: '2',
      name: 'Vegetable Soup',
      creator: 'Jane Smith',
      rating: 3.0,
      category: 'Soup',
      imageUrl: '',
      imageWithoutBackground: '',
      cookingTime: '20 min',
      reviewCount: 5,
      serve: 4,
      isSaved: false,
    ),
    const Recipe(
      id: '3',
      name: 'Chocolate Cake',
      creator: 'John Doe',
      rating: 5.0,
      category: 'Dessert',
      imageUrl: '',
      imageWithoutBackground: '',
      cookingTime: '60 min',
      reviewCount: 20,
      serve: 8,
      isSaved: false,
    ),
  ];

  final Result<List<Recipe>, NetworkError> dummyValue1 = Result.success([]);
  final Result<String, String> dummyValue2 = Result.success('');

  provideDummy(dummyValue1);
  provideDummy(dummyValue2);

  setUp(() {
    mockFetchAllRecipesUseCase = MockFetchAllRecipesUseCase();
    mockFilterRecipesUseCase = MockFilterRecipesUseCase();
    mockFetchRecentSearchKeywordUseCase = MockFetchRecentSearchKeywordUseCase();
    mockSaveSearchKeywordUseCase = MockSaveSearchKeywordUseCase();
    mockDebouncer = MockDebouncer();

    viewModel = SearchRecipesViewModel(
      fetchAllRecipesUseCase: mockFetchAllRecipesUseCase,
      filterRecipesUseCase: mockFilterRecipesUseCase,
      fetchRecentSearchKeywordUseCase: mockFetchRecentSearchKeywordUseCase,
      saveSearchKeywordUseCase: mockSaveSearchKeywordUseCase,
      debouncer: mockDebouncer,
    );

    // Debouncer will execute the function immediately
    when(mockDebouncer.run(any)).thenAnswer((invocation) {
      final function = invocation.positionalArguments[0] as Function;
      function();
    });
  });

  group('SearchRecipesViewModel', () {
    test('initial state is correct', () {
      expect(viewModel.state, const SearchRecipesState());
    });

    group('init', () {
      test('updates state with recipes on success', () async {
        // Given
        when(mockFetchAllRecipesUseCase.execute()).thenAnswer(
          (_) async => Success(mockRecipes),
        );
        when(mockFetchRecentSearchKeywordUseCase.execute()).thenAnswer(
          (_) async => const Success(''),
        );

        // When
        viewModel.init();

        // Then
        expect(viewModel.state.isLoading, isTrue);

        await untilCalled(mockFetchRecentSearchKeywordUseCase.execute());

        expect(viewModel.state.isLoading, isFalse);
        expect(viewModel.state.allRecipes, mockRecipes);
        expect(viewModel.state.filteredRecipes, mockRecipes);
        expect(viewModel.state.resultCount, mockRecipes.length);
        expect(viewModel.state.searchState, SearchStateType.recentSearch);
        verify(mockFetchAllRecipesUseCase.execute()).called(1);
        verify(mockFetchRecentSearchKeywordUseCase.execute()).called(1);
      });

      test('updates state with error on fetchAllRecipes failure', () async {
        // Given
        final networkError = NetworkError.unknown;
        when(mockFetchAllRecipesUseCase.execute()).thenAnswer(
          (_) async => Error(networkError),
        );

        // When
        viewModel.init();

        // Then
        expect(viewModel.state.isLoading, isTrue);
        expectLater(
          viewModel.eventStream,
          emits(SearchRecipesEvent.showErrorDialog(networkError.toString())),
        );

        await untilCalled(mockFetchAllRecipesUseCase.execute());

        expect(viewModel.state.isLoading, isFalse);
        expect(viewModel.state.allRecipes, isEmpty);
        expect(viewModel.state.filteredRecipes, isEmpty);
        verify(mockFetchAllRecipesUseCase.execute()).called(1);
        verifyNever(mockFetchRecentSearchKeywordUseCase.execute());
      });

      test('searches with recent keyword if it exists', () async {
        // Given
        const recentKeyword = 'chicken';
        final filteredList = [mockRecipes.first];
        when(mockFetchAllRecipesUseCase.execute()).thenAnswer(
          (_) async => Success(mockRecipes),
        );
        when(mockFetchRecentSearchKeywordUseCase.execute()).thenAnswer(
          (_) async => const Success(recentKeyword),
        );
        when(
          mockFilterRecipesUseCase.execute(
            mockRecipes,
            recentKeyword,
            const FilterSearchState(),
          ),
        ).thenReturn(filteredList);

        // When
        viewModel.init();
        await untilCalled(mockSaveSearchKeywordUseCase.execute(recentKeyword));

        // Then
        expect(viewModel.state.searchFieldValue, recentKeyword);
        expect(viewModel.state.filteredRecipes, filteredList);
        expect(viewModel.state.searchState, SearchStateType.searchResult);
        verify(mockSaveSearchKeywordUseCase.execute(recentKeyword)).called(1);
      });
    });

    group('onAction', () {
      setUp(() async {
        when(mockFetchAllRecipesUseCase.execute()).thenAnswer(
          (_) async => Success(mockRecipes),
        );
        when(mockFetchRecentSearchKeywordUseCase.execute()).thenAnswer(
          (_) async => const Success(''),
        );
        viewModel.init();
        await untilCalled(mockFetchRecentSearchKeywordUseCase.execute());
      });

      test('ChangeSearchValue filters recipes', () {
        // Given
        const keyword = 'soup';
        final filteredList = [mockRecipes[1]];
        when(
          mockFilterRecipesUseCase.execute(
            mockRecipes,
            keyword,
            viewModel.state.filterState,
          ),
        ).thenReturn(filteredList);

        // When
        viewModel.onAction(
          const SearchRecipesAction.changeSearchValue(keyword),
        );

        // Then
        expect(viewModel.state.filteredRecipes, filteredList);
        expect(viewModel.state.resultCount, filteredList.length);
        expect(viewModel.state.searchFieldValue, keyword);
        expect(viewModel.state.searchState, SearchStateType.searchResult);
        verify(mockSaveSearchKeywordUseCase.execute(keyword)).called(1);
      });

      test(
        'ChangeSearchValue with empty keyword shows all recipes and does not save keyword',
        () {
          // Given
          const keyword = '';
          when(
            mockFilterRecipesUseCase.execute(
              mockRecipes,
              keyword,
              viewModel.state.filterState,
            ),
          ).thenReturn(mockRecipes);

          // When
          viewModel.onAction(
            const SearchRecipesAction.changeSearchValue(keyword),
          );

          // Then
          expect(viewModel.state.filteredRecipes, mockRecipes);
          expect(viewModel.state.resultCount, mockRecipes.length);
          expect(viewModel.state.searchFieldValue, keyword);
          expect(viewModel.state.searchState, SearchStateType.searchResult);
          verifyNever(mockSaveSearchKeywordUseCase.execute(keyword));
        },
      );

      test('ChangeSearchValue shows snackbar when no results found', () {
        // Given
        const keyword = 'nonexistent';
        when(
          mockFilterRecipesUseCase.execute(
            mockRecipes,
            keyword,
            viewModel.state.filterState,
          ),
        ).thenReturn([]);

        // When
        viewModel.onAction(
          const SearchRecipesAction.changeSearchValue(keyword),
        );

        // Then
        expect(viewModel.state.filteredRecipes, isEmpty);
        expect(
          viewModel.eventStream,
          emits(const SearchRecipesEvent.showNoSearchResultSnackBar()),
        );
        verify(mockSaveSearchKeywordUseCase.execute(keyword)).called(1);
      });

      test('SelectFilter filters recipes with new filter state', () {
        // Given
        const filterState = FilterSearchState(
          filterCategory: FilterCategory.localDish,
        );
        final filteredList = [mockRecipes[2]]; // Chocolate Cake
        when(
          mockFilterRecipesUseCase.execute(
            mockRecipes,
            viewModel.state.searchFieldValue,
            filterState,
          ),
        ).thenReturn(filteredList);

        // When
        viewModel.onAction(SearchRecipesAction.selectFilter(filterState));

        // Then
        expect(viewModel.state.filterState, filterState);
        expect(viewModel.state.filteredRecipes, filteredList);
        expect(viewModel.state.resultCount, filteredList.length);
        expect(viewModel.state.searchState, SearchStateType.searchResult);
      });
    });
  });
}

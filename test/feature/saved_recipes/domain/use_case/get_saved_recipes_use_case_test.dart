import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_saved_recipes_use_case_test.mocks.dart';

@GenerateMocks([RecipeRepository, BookmarkRepository])
void main() {
  group('GetSavedRecipesUseCase', () {
    late GetSavedRecipesUseCase useCase;
    late MockRecipeRepository mockRecipeRepository;
    late MockBookmarkRepository mockBookmarkRepository;
    late StreamController<List<String>> bookmarkStreamController;

    setUp(() {
      mockRecipeRepository = MockRecipeRepository();
      mockBookmarkRepository = MockBookmarkRepository();
      useCase = GetSavedRecipesUseCase(
        recipeRepository: mockRecipeRepository,
        bookmarkRepository: mockBookmarkRepository,
      );
      bookmarkStreamController = StreamController<List<String>>.broadcast();

      when(mockBookmarkRepository.fetchBookmarks())
          .thenAnswer((_) => bookmarkStreamController.stream);
    });

    tearDown(() {
      bookmarkStreamController.close();
    });

    final allRecipes = [
      const Recipe(id: '1', name: 'Recipe 1', category: 'Cat1', creator: 'A', cookingTime: '10m', rating: 4, reviewCount: 10, serve: 1, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
      const Recipe(id: '2', name: 'Recipe 2', category: 'Cat2', creator: 'B', cookingTime: '20m', rating: 5, reviewCount: 20, serve: 2, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
      const Recipe(id: '3', name: 'Recipe 3', category: 'Cat1', creator: 'C', cookingTime: '30m', rating: 3, reviewCount: 30, serve: 3, isSaved: false, imageUrl: '', imageWithoutBackground: ''),
    ];

    test(
        'Given repositories are successful, ' 
        'When execute is called, ' 
        'Then it should emit filtered recipes as bookmarks change', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer((_) async => allRecipes);

      // When
      final stream = useCase.execute();

      // Then
      expectLater(
        stream,
        emitsInOrder([
          isA<Success<List<Recipe>, NetworkError>>().having((s) => s.data.map((e) => e.id).toList(), 'data ids', ['1', '3']),
          isA<Success<List<Recipe>, NetworkError>>().having((s) => s.data.map((e) => e.id).toList(), 'data ids', ['1']),
          emitsDone,
        ]),
      );

      // CRITICAL FIX: Wait for the use case to advance past the initial Future.
      await Future.delayed(Duration.zero);

      // Now that the use case is listening, trigger the stream events.
      bookmarkStreamController.add(['1', '3']);
      await Future.delayed(Duration.zero);
      bookmarkStreamController.add(['1']);
      
      await bookmarkStreamController.close();
    });

    test(
        'Given recipe repository fails, ' 
        'When execute is called, ' 
        'Then it should emit a network error and close the stream', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes())
          .thenThrow(NetworkError.serverError);

      // When
      final stream = useCase.execute();

      // Then
      expectLater(
        stream,
        emitsInOrder([
          isA<Error<List<Recipe>, NetworkError>>().having((e) => e.error, 'error type', NetworkError.serverError),
          emitsDone,
        ]),
      );
      
      await bookmarkStreamController.close();
    });

    test(
        'Given bookmark stream fails, ' 
        'When execute is called, ' 
        'Then it should emit an unknown error and close the stream', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer((_) async => allRecipes);

      // When
      final stream = useCase.execute();

      // Then
      expectLater(
        stream,
        emitsInOrder([
           isA<Error<List<Recipe>, NetworkError>>().having((e) => e.error, 'error type', NetworkError.unknown),
           emitsDone,
        ]),
      );

      // Wait for the use case to be listening.
      await Future.delayed(Duration.zero);

      // Trigger the error and close the stream.
      bookmarkStreamController.addError(Exception('Stream failed'));
      await bookmarkStreamController.close();
    });
  });
}

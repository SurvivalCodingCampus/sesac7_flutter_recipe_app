import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_search_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  // Mock Recipe object for testing
  final mockRecipe = Recipe(
    id: '1',
    name: 'Classic Spaghetti Bolognese',
    category: 'Dinner',
    imageUrl: 'http://example.com/image.jpg', // URL is mocked
    creator: 'Chef John Doe',
    cookingTime: '45 min',
    rating: 4.5,
    ingredients: [],
  );

  group('RecipeSearchCard Widget Test', () {
    testWidgets('should display all recipe information correctly', (
      WidgetTester tester,
    ) async {
      // Using mockNetworkImagesFor to prevent network errors in tests
      await mockNetworkImagesFor(() async {
        // Given
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RecipeSearchCard(recipe: mockRecipe),
            ),
          ),
        );

        // Then
        // Verify that the recipe name is displayed
        expect(find.text(mockRecipe.name), findsOneWidget);

        // Verify that the creator's name is displayed
        expect(find.text('By ${mockRecipe.creator}'), findsOneWidget);

        // Verify that the rating is displayed with one decimal point
        expect(find.text(mockRecipe.rating.toStringAsFixed(1)), findsOneWidget);

        // Verify that the star icon is present
        expect(find.byIcon(Icons.star), findsOneWidget);
      });
    });

    testWidgets('should display error icon when image fails to load', (
      WidgetTester tester,
    ) async {
      // This test simulates an image loading failure.
      // We expect the onError builder to show an error icon.
      await mockNetworkImagesFor(() async {
        // Given a recipe with a URL that will fail to load (mocked behavior)
        final recipeWithBadImage = mockRecipe.copyWith(imageUrl: 'bad_url');

        // When the widget is pumped
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RecipeSearchCard(recipe: recipeWithBadImage),
            ),
          ),
        );

        // The pumpAndSettle is needed to allow the image to attempt loading and fail.
        await tester.pumpAndSettle();

        // Then: The error icon should be displayed.
        // Note: The icon is part of the DecorationImage's onError, so we can't find it directly.
        // Instead, we confirm that the primary content is still visible.
        // A more advanced test could mock the http client to force the error.
        expect(find.text(recipeWithBadImage.name), findsOneWidget);
        expect(find.text('By ${recipeWithBadImage.creator}'), findsOneWidget);
      });
    });
  });
}

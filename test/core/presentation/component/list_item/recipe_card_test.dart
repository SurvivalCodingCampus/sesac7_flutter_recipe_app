import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('RecipeCard', () {
    final testRecipe = Recipe(
      id: '1',
      name: 'Delicious Pasta with Tomato Sauce and Meatballs',
      category: 'Italian',
      imageUrl: '',
      creator: 'Chef Mario',
      cookingTime: '30 min',
      rating: 4.7,
      imageWithoutBackground: '',
      reviewCount: 0,
      serve: 0,
      isSaved: false,
    );

    testWidgets('renders all recipe details correctly', (tester) async {
      await mockNetworkImagesFor(() async {
        bool bookmarkTapped = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RecipeCard(
                recipe: testRecipe,
                onBookmarkTap: () {
                  bookmarkTapped = true;
                },
              ),
            ),
          ),
        );

        // Verify recipe name, creator, cooking time, and rating
        expect(find.text(testRecipe.name), findsOneWidget);
        expect(find.text('By ${testRecipe.creator}'), findsOneWidget);
        expect(find.text(testRecipe.cookingTime), findsOneWidget);
        expect(find.text(testRecipe.rating.toStringAsFixed(1)), findsOneWidget);

        // Verify icons
        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.byIcon(Icons.timer_outlined), findsOneWidget);
        expect(find.byIcon(Icons.bookmark_outline), findsOneWidget);

        // Verify bookmark tap
        await tester.tap(find.byIcon(Icons.bookmark_outline));
        await tester.pumpAndSettle();
        expect(bookmarkTapped, isTrue);
      });
    });

    testWidgets('truncates long recipe name with ellipsis', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RecipeCard(
                recipe: testRecipe,
                onBookmarkTap: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text(testRecipe.name));
        expect(textWidget.maxLines, 2);
        expect(textWidget.overflow, TextOverflow.ellipsis);
      });
    });
  });
}

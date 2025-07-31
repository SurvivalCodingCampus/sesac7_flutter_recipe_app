
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/category_button.dart';
import 'package:flutter_recipe_app/presentation/component/selector/recipe_category_selector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecipeCategorySelector', () {
    final Set<String> testCategories = {'Category A', 'Category B', 'Category C'};

    testWidgets('RecipeCategorySelector renders correctly with categories', (tester) async {
      String selectedCategory = 'All';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCategorySelector(
              categories: testCategories,
              selectedCategory: selectedCategory,
              onValueChange: (category) {
                selectedCategory = category;
              },
            ),
          ),
        ),
      );

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Category A'), findsOneWidget);
      expect(find.text('Category B'), findsOneWidget);
      expect(find.text('Category C'), findsOneWidget);

      // Verify 'All' button is selected initially
      final allButton = tester.widget<CategoryButton>(find.widgetWithText(CategoryButton, 'All'));
      expect(allButton.isSelected, isTrue);

      // Verify other buttons are not selected
      final categoryAButton = tester.widget<CategoryButton>(find.widgetWithText(CategoryButton, 'Category A'));
      expect(categoryAButton.isSelected, isFalse);
    });

    testWidgets('RecipeCategorySelector calls onValueChange when category button is tapped', (tester) async {
      String selectedCategory = 'All';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCategorySelector(
              categories: testCategories,
              selectedCategory: selectedCategory,
              onValueChange: (category) {
                selectedCategory = category;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Category A'));
      await tester.pump();

      expect(selectedCategory, 'Category A');
    });

    testWidgets('RecipeCategorySelector does not call onValueChange if same category is tapped', (tester) async {
      String selectedCategory = 'Category A';
      int callCount = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCategorySelector(
              categories: testCategories,
              selectedCategory: selectedCategory,
              onValueChange: (category) {
                callCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Category A'));
      await tester.pump();

      expect(callCount, 0);
    });
  });
}

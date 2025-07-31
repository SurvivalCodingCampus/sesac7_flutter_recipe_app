
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchRecipeFilterButton', () {
    testWidgets('SearchRecipeFilterButton renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchRecipeFilterButton(
              onClick: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.tune_rounded), findsOneWidget);
      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.primary100);
      final Icon icon = tester.widget(find.byIcon(Icons.tune_rounded));
      expect(icon.color, AppColors.white);
    });

    testWidgets('SearchRecipeFilterButton calls onClick when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchRecipeFilterButton(
              onClick: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SearchRecipeFilterButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

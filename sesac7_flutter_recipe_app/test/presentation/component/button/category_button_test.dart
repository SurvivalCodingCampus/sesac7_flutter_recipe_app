
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/category_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryButton', () {
    testWidgets('CategoryButton renders correctly when not selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryButton(
              title: 'Test Category',
              isSelected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Category'), findsOneWidget);
      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.white);
      final Text textWidget = tester.widget(find.text('Test Category'));
      expect(textWidget.style, TextStyles.unSelectedCategoryTitle);
    });

    testWidgets('CategoryButton renders correctly when selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryButton(
              title: 'Test Category',
              isSelected: true,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Category'), findsOneWidget);
      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.primary100);
      final Text textWidget = tester.widget(find.text('Test Category'));
      expect(textWidget.style, TextStyles.selectedCategoryTitle);
    });

    testWidgets('CategoryButton calls onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryButton(
              title: 'Test Category',
              isSelected: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CategoryButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

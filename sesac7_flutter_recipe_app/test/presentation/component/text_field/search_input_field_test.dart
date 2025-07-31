
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchInputField', () {
    testWidgets('SearchInputField renders correctly with hint', (tester) async {
      const String testHint = 'Search for recipes';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchInputField(
              hint: testHint,
              onSearchKeywordChange: (keyword) {},
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(testHint), findsOneWidget);
      expect(find.byIcon(Icons.search_outlined), findsOneWidget);

      final TextField textField = tester.widget(find.byType(TextField));
      expect(textField.decoration?.hintText, testHint);
      expect(textField.decoration?.hintStyle, TextStyles.searchInputFieldHint);
      expect(textField.decoration?.fillColor, AppColors.white);
    });

    testWidgets('onSearchKeywordChange is called when text is entered', (tester) async {
      String capturedKeyword = '';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchInputField(
              hint: 'Search',
              onSearchKeywordChange: (keyword) {
                capturedKeyword = keyword;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'pizza');
      await tester.pump();

      expect(capturedKeyword, 'pizza');
    });

    testWidgets('onSearchIconClick is called when search icon is tapped', (tester) async {
      bool iconClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchInputField(
              hint: 'Search',
              onSearchKeywordChange: (keyword) {},
              onSearchIconClick: () {
                iconClicked = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search_outlined));
      await tester.pump();

      expect(iconClicked, isTrue);
    });
  });
}

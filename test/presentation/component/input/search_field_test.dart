import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/input/search_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchField Widget Test', () {
    testWidgets('should display placeholder and initial value correctly', (
      WidgetTester tester,
    ) async {
      // Given
      const placeholderText = 'Search here...';
      const initialValue = 'Initial search';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              placeholder: placeholderText,
              value: initialValue,
              onValueChange: (_) {},
            ),
          ),
        ),
      );

      // Then
      expect(find.text(placeholderText), findsOneWidget);
      expect(find.text(initialValue), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should call onValueChange when text is entered', (
      WidgetTester tester,
    ) async {
      // Given
      String? changedValue;
      const textToEnter = 'New search query';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              placeholder: 'Search',
              onValueChange: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      // When
      await tester.enterText(find.byType(TextFormField), textToEnter);
      await tester.pump();

      // Then
      expect(changedValue, textToEnter);
    });
  });
}

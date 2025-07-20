import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'FilterButton Widget Test',
    () {
      testWidgets('should display correctly when selected', (tester) async {
        // Given
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FilterButton(
                text: 'Selected',
                isSelected: true,
                onTap: (_) {},
              ),
            ),
          ),
        );

        // Then
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(FilterButton),
            matching: find.byType(Container),
          ),
        );
        final decoration = container.decoration as BoxDecoration;

        final text = tester.widget<Text>(find.text('Selected'));

        expect(find.text('Selected'), findsOneWidget);
        expect(decoration.color, AppColors.primary100);
        expect((decoration.border as Border).top.color, AppColors.primary100);
        expect(text.style?.color, AppColors.white);
      });

      testWidgets('should display correctly when not selected', (tester) async {
        // Given
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FilterButton(
                text: 'Not Selected',
                isSelected: false,
                onTap: (_) {},
              ),
            ),
          ),
        );

        // Then
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(FilterButton),
            matching: find.byType(Container),
          ),
        );
        final decoration = container.decoration as BoxDecoration;

        final text = tester.widget<Text>(find.text('Not Selected'));

        expect(find.text('Not Selected'), findsOneWidget);
        expect(decoration.color, AppColors.white);
        expect((decoration.border as Border).top.color, AppColors.primary80);
        expect(text.style?.color, AppColors.primary80);
      });

      testWidgets('should call onTap with correct value when tapped', (
        tester,
      ) async {
        // Given
        bool? capturedValue;
        const initialSelectedState = true;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FilterButton(
                text: 'Tap Test',
                isSelected: initialSelectedState,
                onTap: (oldValue) {
                  capturedValue = oldValue;
                },
              ),
            ),
          ),
        );

        // When
        await tester.tap(find.byType(FilterButton));
        await tester.pump();

        // Then
        expect(capturedValue, initialSelectedState);
      });
    },
  );
}

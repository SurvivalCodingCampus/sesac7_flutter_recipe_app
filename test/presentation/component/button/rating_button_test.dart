import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockVoidCallback extends Mock {
  void call(bool oldValue);
}

void main() {
  group('RatingButton', () {
    testWidgets('renders correctly when isSelected is true', (tester) async {
      final mockOnTap = MockVoidCallback();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              text: '5',
              isSelected: true,
              onTap: mockOnTap.call,
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.primary100);
      expect(decoration.border!.top.color, AppColors.primary100);

      final textWidget = tester.widget<Text>(find.text('5'));
      expect(textWidget.style!.color, AppColors.white);

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.color, AppColors.white);
    });

    testWidgets('renders correctly when isSelected is false', (tester) async {
      final mockOnTap = MockVoidCallback();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              text: '4',
              isSelected: false,
              onTap: mockOnTap.call,
            ),
          ),
        ),
      );

      expect(find.text('4'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.white);
      expect(decoration.border!.top.color, AppColors.primary80);

      final textWidget = tester.widget<Text>(find.text('4'));
      expect(textWidget.style!.color, AppColors.primary80);

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.color, AppColors.primary80);
    });

    testWidgets('calls onTap with correct oldValue when tapped', (
      tester,
    ) async {
      final mockOnTap = MockVoidCallback();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              text: '3',
              isSelected: false,
              onTap: mockOnTap.call,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RatingButton));
      verify(mockOnTap.call(false)).called(1);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              text: '3',
              isSelected: true,
              onTap: mockOnTap.call,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RatingButton));
      verify(mockOnTap.call(true)).called(1);
    });
  });
}

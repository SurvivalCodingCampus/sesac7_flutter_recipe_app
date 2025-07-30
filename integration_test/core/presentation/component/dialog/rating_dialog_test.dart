import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingDialog Widget Test', () {
    const dialogTitle = 'Rate this recipe';
    const actionText = 'Submit';
    int? returnedRating;

    Future<void> pumpRatingDialog(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: dialogTitle,
              actionName: actionText,
              onTapBackground: () {},
              onTapActionButton: (rating) {
                returnedRating = rating;
              },
            ),
          ),
        ),
      );
    }

    setUp(() {
      returnedRating = null;
    });

    testWidgets('Given the dialog is displayed, '
        'Then the initial UI should be rendered correctly', (
      WidgetTester tester,
    ) async {
      // Given
      await pumpRatingDialog(tester);

      // Then
      expect(find.text(dialogTitle), findsOneWidget);
      expect(find.text(actionText), findsOneWidget);
      expect(
        find.byIcon(Icons.star_border),
        findsNWidgets(RatingDialog.maxRating),
      );
      expect(find.byIcon(Icons.star), findsNothing);

      final actionButton = tester.widget<Container>(
        find.descendant(
          of: find.byKey(RatingDialog.actionKey),
          matching: find.byType(Container),
        ),
      );
      expect((actionButton.decoration as BoxDecoration).color, AppColors.gray4);
    });

    testWidgets(
      'When a star is tapped, '
      'Then the rating should update and the action button should be enabled',
      (WidgetTester tester) async {
        // Given
        await pumpRatingDialog(tester);

        // When
        await tester.tap(find.byIcon(Icons.star_border).at(2));
        await tester.pump();

        // Then
        expect(find.byIcon(Icons.star), findsNWidgets(3));
        expect(find.byIcon(Icons.star_border), findsNWidgets(2));

        final actionButton = tester.widget<Container>(
          find.descendant(
            of: find.byKey(RatingDialog.actionKey),
            matching: find.byType(Container),
          ),
        );
        expect(
          (actionButton.decoration as BoxDecoration).color,
          AppColors.rating,
        );
      },
    );

    testWidgets('Given no rating is selected, '
        'When the action button is tapped, '
        'Then the callback should not be invoked', (WidgetTester tester) async {
      // Given
      await pumpRatingDialog(tester);

      // When
      await tester.tap(find.byKey(RatingDialog.actionKey));
      await tester.pump();

      // Then
      expect(returnedRating, isNull);
    });

    testWidgets('Given a rating is selected, '
        'When the action button is tapped, '
        'Then the callback should be invoked with the correct rating', (
      WidgetTester tester,
    ) async {
      // Given
      await pumpRatingDialog(tester);
      await tester.tap(find.byIcon(Icons.star_border).at(3));
      await tester.pump();

      // When
      await tester.tap(find.byKey(RatingDialog.actionKey));
      await tester.pump();

      // Then
      expect(returnedRating, 4);
    });

    testWidgets(
      'When the background is tapped, Then the onTapBackground callback should be invoked',
      (WidgetTester tester) async {
        // Given
        bool backgroundTapped = false;
        await tester.pumpWidget(
          MaterialApp(
            home: RatingDialog(
              title: dialogTitle,
              actionName: actionText,
              onTapBackground: () {
                backgroundTapped = true;
              },
              onTapActionButton: (rating) {},
            ),
          ),
        );

        // When
        // The background is a GestureDetector wrapping the dialog barrier.
        // We simulate a tap outside the dialog area.
        await tester.tapAt(const Offset(300, 300));
        await tester.pump();

        // Then
        expect(backgroundTapped, isTrue);
      },
    );
  });
}

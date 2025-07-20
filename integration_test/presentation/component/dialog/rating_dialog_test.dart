import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('RatingDialog Integration Test', () {
    const dialogTitle = 'Rate this recipe';
    const actionText = 'Submit';

    testWidgets('should display initial state correctly', (
      WidgetTester tester,
    ) async {
      // Given: The RatingDialog is rendered.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: dialogTitle,
              actionName: actionText,
              onChange: (rating) {},
            ),
          ),
        ),
      );

      // Then: The title and action button text should be visible.
      expect(find.text(dialogTitle), findsOneWidget);
      expect(find.text(actionText), findsOneWidget);

      // And: All 5 stars should be unselected (star_border icon).
      expect(
        find.byIcon(Icons.star_border),
        findsNWidgets(RatingDialog.maxRating),
      );
      expect(find.byIcon(Icons.star), findsNothing);

      // And: The action button should be disabled (gray color).
      final actionButton = tester.widget<Container>(
        find.descendant(
          of: find.byKey(RatingDialog.actionKey),
          matching: find.byType(Container),
        ),
      );
      expect((actionButton.decoration as BoxDecoration).color, AppColors.gray4);
    });

    testWidgets('should select stars and enable the action button on tap', (
      WidgetTester tester,
    ) async {
      // Given: The RatingDialog is rendered.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: RatingDialog(
                title: dialogTitle,
                actionName: actionText,
                onChange: (rating) {},
              ),
            ),
          ),
        ),
      );

      // When: The user taps the 3rd star.
      final starIconFinder = find.byIcon(Icons.star_border).at(2);
      final starGestureDetectorFinder = find.ancestor(
        of: starIconFinder,
        matching: find.byType(GestureDetector),
      );
      await tester.tap(starGestureDetectorFinder);
      await tester.pump();

      // Then: The first 3 stars should be selected (star icon).
      expect(find.byIcon(Icons.star), findsNWidgets(3));
      // And: The remaining 2 stars should be unselected (star_border icon).
      expect(find.byIcon(Icons.star_border), findsNWidgets(2));

      // And: The action button should be enabled (rating color).
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
    });

    testWidgets(
      'should call onChange with correct rating when action is tapped',
      (WidgetTester tester) async {
        // Given: A variable to hold the returned rating.
        int? returnedRating;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: RatingDialog(
                  title: dialogTitle,
                  actionName: actionText,
                  onChange: (rating) {
                    returnedRating = rating;
                  },
                ),
              ),
            ),
          ),
        );

        // When: The user taps the action button without selecting a star.
        await tester.tap(find.text(actionText));
        await tester.pump();

        // Then: The callback should not have been called.
        expect(returnedRating, isNull);

        // When: The user selects 4 stars.
        final starIconFinder = find.byIcon(Icons.star_border).at(3);
        final starGestureDetectorFinder = find.ancestor(
          of: starIconFinder,
          matching: find.byType(GestureDetector),
        );
        await tester.tap(starGestureDetectorFinder);
        await tester.pump();

        // And: The user taps the action button.
        await tester.tap(find.text(actionText));
        await tester.pump();

        // Then: The callback should be called with the correct rating.
        expect(returnedRating, 4);
      },
    );
  });
}

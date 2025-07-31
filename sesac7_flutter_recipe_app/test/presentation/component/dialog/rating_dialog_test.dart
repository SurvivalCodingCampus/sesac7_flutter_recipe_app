
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_dialog_button.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingDialog', () {
    testWidgets('RatingDialog renders correctly with title and buttons', (tester) async {
      const String testTitle = 'Rate this recipe';
      const String testButtonTitle = 'Send';
      const RatingType initialRating = RatingType.gradeThree;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: testTitle,
              dialogButtonTitle: testButtonTitle,
              currentRatingType: initialRating,
              onClickDismissButton: (ratingType) {},
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testButtonTitle), findsOneWidget);
      expect(find.byType(RatingDialogButton), findsOneWidget);
      expect(find.byIcon(Icons.star), findsNWidgets(initialRating.getIntValue()));
      expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(5 - initialRating.getIntValue()));
    });

    testWidgets('RatingDialog updates selected rating when star is tapped', (tester) async {
      const String testTitle = 'Rate this recipe';
      const String testButtonTitle = 'Send';
      const RatingType initialRating = RatingType.gradeOne;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: testTitle,
              dialogButtonTitle: testButtonTitle,
              currentRatingType: initialRating,
              onClickDismissButton: (ratingType) {},
            ),
          ),
        ),
      );

      // Tap the 4th star (RatingType.gradeFour)
      await tester.tap(find.byIcon(Icons.star_border_outlined).at(0)); // This taps the first outlined star, which should be the 2nd star
      await tester.pump();

      expect(find.byIcon(Icons.star), findsNWidgets(2)); // Now 2 stars should be filled
      expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(3));

      // Tap the 5th star (RatingType.gradeFive)
      await tester.tap(find.byIcon(Icons.star_border_outlined).at(0)); // This taps the first outlined star, which should be the 3rd star
      await tester.pump();

      expect(find.byIcon(Icons.star), findsNWidgets(3)); // Now 3 stars should be filled
      expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(2));
    });

    testWidgets('RatingDialog calls onClickDismissButton when button is tapped with selected rating', (tester) async {
      RatingType? capturedRating;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: 'Test',
              dialogButtonTitle: 'Send',
              currentRatingType: RatingType.gradeThree,
              onClickDismissButton: (ratingType) {
                capturedRating = ratingType;
              },
            ),
          ),
        ),
      );

      // Tap the send button
      await tester.tap(find.byType(RatingDialogButton));
      await tester.pump();

      expect(capturedRating, RatingType.gradeThree);
    });

    testWidgets('RatingDialog does not call onClickDismissButton if rating is 0', (tester) async {
      RatingType? capturedRating;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: 'Test',
              dialogButtonTitle: 'Send',
              currentRatingType: RatingType.gradeZero,
              onClickDismissButton: (ratingType) {
                capturedRating = ratingType;
              },
            ),
          ),
        ),
      );

      // Tap the send button
      await tester.tap(find.byType(RatingDialogButton));
      await tester.pump();

      expect(capturedRating, isNull);
    });
  });
}

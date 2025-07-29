import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_dialog_button.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('RatingDialogTest', () {
    testWidgets('RatingDialog Init Rating Icon Test', (tester) async {
      final String dialogTitle = 'Rate recipe';
      final String dialogButtonTitle = 'Send';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: dialogTitle,
              dialogButtonTitle: dialogButtonTitle,
              currentRatingType: RatingType.gradeZero,
              onClickDismissButton: (RatingType ratingType) {},
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(5));
      expect(find.byIcon(Icons.star), findsNothing);
    });
    testWidgets('RatingDialog Send Button Inactive Test', (tester) async {
      final String dialogTitle = 'Rate recipe';
      final String dialogButtonTitle = 'Send';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              dialogTitle: dialogTitle,
              dialogButtonTitle: dialogButtonTitle,
              currentRatingType: RatingType.gradeZero,
              onClickDismissButton: (int value) {},
            ),
          ),
        ),
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is RatingDialogButton) {
            return widget.buttonTitle == dialogButtonTitle &&
                !widget.buttonActive;
          }
          return false;
        }),
        findsOneWidget,
      );
    });

    // testWidgets('RatingDialog Send Button Active Test', (tester) async {
    //   final String dialogTitle = 'Rate recipe';
    //   final String dialogButtonTitle = 'Send';
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: RatingDialog(
    //           dialogTitle: dialogTitle,
    //           dialogButtonTitle: dialogButtonTitle,
    //           currentRatingType: RatingType.gradeZero,
    //           onChange: (int value) {},
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   await tester.tap(find.byIcon(Icons.star_border_outlined).at(2));
    //   await tester.pump();
    //
    //   expect(find.byWidgetPredicate((widget) {
    //     if (widget is RatingDialogButton) {
    //       return widget.buttonTitle == dialogButtonTitle && widget.buttonActive;
    //     }
    //     return false;
    //   }), findsOneWidget);
    // });
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_dialog_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingDialogButtonTest', () {
    final String ratingDialogButtonTitle = 'Send';
    bool buttonActiveState = false;
    testWidgets('RatingDialogButton Finder Test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialogButton(
              buttonTitle: ratingDialogButtonTitle,
              buttonActive: buttonActiveState,
              onTap: () {},
            ),
          ),
        ),
      );
      final Finder ratingDialogButtonFinder = find.text(
        ratingDialogButtonTitle,
      );
      expect(ratingDialogButtonFinder, findsOneWidget);
    });
    testWidgets('RatingDialogButton onTap Test', (tester) async {
      final Key ratingDialogButtonKey = Key('RatingDialogButtonKey');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialogButton(
              key: ratingDialogButtonKey,
              buttonTitle: ratingDialogButtonTitle,
              buttonActive: buttonActiveState,
              onTap: () {
                buttonActiveState = true;
              },
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(ratingDialogButtonKey));
      await tester.pump();

      expect(buttonActiveState, isTrue);
    });
  });
}

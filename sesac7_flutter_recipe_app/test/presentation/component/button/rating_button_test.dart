import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingButtonTest', () {
    final String ratingButtonTitle = '1';
    bool selectedState = false;
    testWidgets('RatingButton Finder Test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              ratingButtonTitle: ratingButtonTitle,
              isSelected: selectedState,
              onValueChange: (isSelected) {},
            ),
          ),
        ),
      );
      final Finder ratingButtonFinder = find.text(ratingButtonTitle);
      expect(ratingButtonFinder, findsOneWidget);
    });
    testWidgets('RatingButton onValueChange Test', (tester) async {
      final Key ratingButtonKey = Key('RatingButtonKey');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              key: ratingButtonKey,
              ratingButtonTitle: ratingButtonTitle,
              isSelected: selectedState,
              onValueChange: (isSelected) {
                selectedState = isSelected;
              },
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(ratingButtonKey));
      await tester.pump();

      expect(selectedState, isTrue);
    });
  });
}

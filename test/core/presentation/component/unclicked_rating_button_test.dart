import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/unclicked_rating_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UnclickedRatingButton renders correctly', (tester) async {
    // given
    final testText = '4';
    final testIsSelected = false;

    await tester.pumpWidget(
      MaterialApp(
        home: UnclickedRatingButton(
          text: testText,
          isSelected: testIsSelected,
          onClick: () {},
        ),
      ),
    );

    // then
    expect(find.byType(UnclickedRatingButton), findsOneWidget);
    expect(find.text(testText), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}

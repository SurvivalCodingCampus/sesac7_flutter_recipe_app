import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/unclicked_filter_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UnclickedFilterButton renders correctly', (tester) async {
    // given
    final testText = 'button';
    final testIsSelected = false;

    await tester.pumpWidget(
      MaterialApp(
        home: UnclickedFilterButton(
          text: testText,
          isSelected: testIsSelected,
          onClick: () {},
        ),
      ),
    );

    // then
    expect(find.byType(UnclickedFilterButton), findsOneWidget);
    expect(find.text(testText), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('medium button', (tester) async {
    //given
    final String btnName = 'button';

    await tester.pumpWidget(
      MaterialApp(
        home: MediumButton(
          text: btnName,
          onClick: (String text) {
            print(text);
          },
        ),
      ),
    );

    //when
    final Finder btnFinder = find.text(btnName);
    final Finder mediumBtnFinder = find.byKey(const Key('medium button'));

    //then
    expect(btnFinder, findsOneWidget);
    expect(mediumBtnFinder, findsOneWidget);
  });
}

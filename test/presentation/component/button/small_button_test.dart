import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('small button', (tester) async {
    //given
    final String btnName = 'button';

    await tester.pumpWidget(
      MaterialApp(
        home: SmallButton(
          text: btnName,
          onClick: (String text) {
            print(text);
          },
        ),
      ),
    );

    //when
    final Finder btnFinder = find.text(btnName);
    final Finder smallBtnFinder = find.byKey(const Key('small button'));

    //then
    expect(btnFinder, findsOneWidget);
    expect(smallBtnFinder, findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('big button', (tester) async {
    //given
    final String btnName = 'button';

    await tester.pumpWidget(
      MaterialApp(
        home: BigButton(
          text: btnName,
          onClick: (String text) {
          },
        ),
      ),
    );

    //when
    final Finder btnFinder = find.text(btnName);
    final Finder bigBtnFinder = find.byKey(const Key('big button'));

    //then
    expect(btnFinder, findsOneWidget);
    expect(bigBtnFinder, findsOneWidget);
  });
}

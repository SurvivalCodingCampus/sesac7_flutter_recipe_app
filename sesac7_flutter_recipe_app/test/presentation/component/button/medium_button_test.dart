import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String mediumBtnTitle = '미디움버튼';

  testWidgets('MediumButton Title Test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediumButton(title: mediumBtnTitle),
        ),
      ),
    );

    final Finder mediumButtonTitleFinder = find.text(mediumBtnTitle);

    expect(mediumButtonTitleFinder, findsOneWidget);
  });

  testWidgets('MediumButton onClick Test', (tester) async {
    bool isClicked = false;
    final String mediumBtnKey = 'MediumBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediumButton(
            key: Key(mediumBtnKey),
            title: mediumBtnKey,
            onClick: () {
              isClicked = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(mediumBtnKey)));
    await tester.pump();

    expect(isClicked, isTrue);
  });
}

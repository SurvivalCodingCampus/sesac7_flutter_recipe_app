import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String bigBtnTitle = '빅버튼';
  testWidgets('BigButton Title Test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(title: bigBtnTitle),
        ),
      ),
    );

    final Finder bigButtonTitleFinder = find.text(bigBtnTitle);

    expect(bigButtonTitleFinder, findsOneWidget);
  });

  testWidgets('BigButton onClick Test', (tester) async {
    bool isClicked = false;
    final String bigBtnTitle = '빅버튼';
    final String bigBtnKey = 'BigBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(
            key: Key(bigBtnKey),
            title: bigBtnTitle,
            onClick: () {
              isClicked = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(bigBtnKey)));
    await tester.pump();

    expect(isClicked, isTrue);
  });
}

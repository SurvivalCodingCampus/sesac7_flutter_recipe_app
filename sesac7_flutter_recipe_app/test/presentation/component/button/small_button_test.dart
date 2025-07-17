import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String smallBtnTitle = '스몰버튼';

  testWidgets('SmallButton Title Test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallButton(
            title: smallBtnTitle,
            onClick: () {},
          ),
        ),
      ),
    );

    final Finder smallButtonTitleFinder = find.text(smallBtnTitle);

    expect(smallButtonTitleFinder, findsOneWidget);
  });

  testWidgets('SmallButton onClick Test', (tester) async {
    bool isClick = false;
    final String smallBtnKey = 'SmallBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallButton(
            key: Key(smallBtnKey),
            title: smallBtnKey,
            onClick: () {
              isClick = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(smallBtnKey)));
    await tester.pump();

    expect(isClick, equals(isTrue));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/tap_state_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String mediumBtnTitle = '미디움버튼';

  testWidgets('MediumButton Title Test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediumButton(
            title: mediumBtnTitle,
            isTapDown: false,
            onTapStateChange: (tapState) {},
          ),
        ),
      ),
    );

    final Finder mediumButtonTitleFinder = find.text(mediumBtnTitle);

    expect(mediumButtonTitleFinder, findsOneWidget);
  });

  testWidgets('MediumButton onClick Test', (tester) async {
    TapStateType? tapStateType;
    final String mediumBtnKey = 'MediumBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediumButton(
            key: Key(mediumBtnKey),
            title: mediumBtnKey,
            isTapDown: false,
            onTapStateChange: (tapState) {
              tapStateType = tapState;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(mediumBtnKey)));
    await tester.pump();

    expect(tapStateType, equals(TapStateType.onTapUp));
  });
}

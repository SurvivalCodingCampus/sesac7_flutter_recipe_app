import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/tap_state_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SmallButton onClick Test', (tester) async {
    final String smallBtnTitle = '스몰버튼';
    TapStateType? tapStateType;
    final String smallBtnKey = 'SmallBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallButton(
            key: Key(smallBtnKey),
            title: smallBtnTitle,
            isTapDown: false,
            onTapStateChange: (tapState) {
              tapStateType = tapState;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(smallBtnKey)));
    await tester.pump(Duration(seconds: 2));

    expect(tapStateType, equals(TapStateType.onTapUp));
  });
}

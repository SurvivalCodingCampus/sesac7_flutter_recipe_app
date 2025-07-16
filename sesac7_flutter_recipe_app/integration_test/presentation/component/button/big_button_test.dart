import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/tap_state_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('BigButton end-to-end Test', (tester) async {
    TapStateType? tapStateType;
    final String bigBtnTitle = '빅버튼';
    final String bigBtnKey = 'BigBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(
            key: Key(bigBtnKey),
            title: bigBtnTitle,
            isTapDown: false,
            onTapStateChange: (tapState) {
              tapStateType = tapState;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(bigBtnKey)));
    await tester.pump(Duration(seconds: 2));

    expect(tapStateType, equals(TapStateType.onTapUp));
  });
}

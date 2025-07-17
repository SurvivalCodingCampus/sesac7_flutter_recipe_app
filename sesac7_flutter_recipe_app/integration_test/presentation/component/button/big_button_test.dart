import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('BigButton end-to-end Test', (tester) async {
    bool isClick = false;
    final String bigBtnTitle = '빅버튼';
    final String bigBtnKey = 'BigBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(
            key: Key(bigBtnKey),
            title: bigBtnTitle,
            onClick: () {
              isClick = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(bigBtnKey)));
    await tester.pump(Duration(seconds: 2));

    expect(isClick, equals(isTrue));
  });
}

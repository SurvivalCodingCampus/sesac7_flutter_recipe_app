import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SmallButton end-to-end Test', (tester) async {
    bool isClick = false;
    final String smallBtnTitle = '스몰버튼';
    final String smallBtnKey = 'SmallBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallButton(
            key: Key(smallBtnKey),
            title: smallBtnTitle,
            onClick: () {
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(smallBtnKey)));
    await tester.pump(Duration(seconds: 2));

    expect(isClick, equals(isTrue));
  });
}

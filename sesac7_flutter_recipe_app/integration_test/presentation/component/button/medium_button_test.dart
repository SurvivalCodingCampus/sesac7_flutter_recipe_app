import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MediumButton end-to-end Test', (tester) async {
    bool isClick = false;
    final String mediumBtnTitle = '미디움버튼';
    final String mediumBtnKey = 'MediumBtnKey';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediumButton(
            key: Key(mediumBtnKey),
            title: mediumBtnTitle,
            onClick: () {
              isClick = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(Key(mediumBtnKey)));
    await tester.pump(Duration(seconds: 2));

    expect(isClick, equals(isTrue));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';

void main() {
  group('SmallButton 위젯 테스트', () {
    testWidgets('버튼 텍스트 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
              buttonText: '작은 버튼',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('작은 버튼'), findsOneWidget);
    });

    testWidgets('버튼 탭 onTap 콜백 테스트', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
              buttonText: '탭 스몰',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('탭 스몰'));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });
}
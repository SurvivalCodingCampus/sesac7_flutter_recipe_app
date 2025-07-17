import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MediumButton 위젯 테스트', () {
    testWidgets('버튼 텍스트 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
              buttonText: '중간 버튼',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('중간 버튼'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('버튼 탭 onTap 콜백 테스트', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
              buttonText: '탭 미디엄',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('탭 미디엄'));

      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
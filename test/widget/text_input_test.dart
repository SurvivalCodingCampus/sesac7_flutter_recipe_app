import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/input/text_input.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextInput 위젯 테스트', () {
    testWidgets('텍스트 입력 필드 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextInput(
              labelText: 'label',
              placeholderText: 'place holder',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('label'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('onChanged 호출 테스트', (WidgetTester tester) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextInput(
              labelText: '입력 테스트',
              placeholderText: '입력하세요',
              onChanged: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), '테스트 입력');
      await tester.pump();

      expect(changedValue, '테스트 입력');
    });

    testWidgets('텍스트 필드 비활성화 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextInput(
              labelText: '비활성화 테스트',
              placeholderText: '비활성화됨',
              onChanged: (value) {},
              isDisabled: true,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);

      final inputDecoration = textField.decoration as InputDecoration;
      expect(inputDecoration.fillColor, AppColor.Gray4);
      expect(inputDecoration.hintStyle?.color, AppColor.Gray2);
    });

    testWidgets('텍스트 필드가 활성화 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextInput(
              labelText: '활성화 테스트',
              placeholderText: '활성화됨',
              onChanged: (value) {},
              isDisabled: false,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isTrue);

      final inputDecoration = textField.decoration as InputDecoration;
      expect(inputDecoration.fillColor, AppColor.White);
      expect(inputDecoration.hintStyle?.color, AppColor.Gray4);
    });
  });
}
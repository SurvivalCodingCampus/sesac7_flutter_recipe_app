import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/input/input_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedLabel = 'Label';
  final expectedPlaceholder = 'placeholder';
  final expectedValue = 'Initial Value';

  group(
    'label',
    () {
      testWidgets('Label displays the expected value.', (tester) async {
        // given

        // when
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: InputField(
                label: expectedLabel,
                placeholder: expectedPlaceholder,
                value: expectedValue,
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        // then
        expect(find.text(expectedLabel), findsOneWidget);
      });
    },
  );
  group(
    'value',
    () {
      testWidgets('Value displays the expected value.', (tester) async {
        // given

        // when
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: InputField(
                label: expectedLabel,
                placeholder: expectedPlaceholder,
                value: expectedValue,
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        // then
        expect(find.text(expectedValue), findsOneWidget);
      });
    },
  );

  group('onValueChange', () {
    testWidgets('onValueChange is called with the correct value.', (
      tester,
    ) async {
      // given
      final expectedValue = 'New Value';
      String? newValue;
      void onValueChange(String value) {
        newValue = value;
      }

      // when
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputField(
              label: expectedLabel,
              placeholder: expectedPlaceholder,
              onValueChange: onValueChange,
            ),
          ),
        ),
      );
      expect(newValue, isNull);
      await tester.enterText(find.byType(TextFormField), expectedValue);

      // then
      expect(newValue, expectedValue);
    });
  });
}

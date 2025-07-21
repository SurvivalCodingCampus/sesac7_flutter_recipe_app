import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InputTextField Find Test', (tester) async {
    final String inputFiledLabel = 'LabelTest';
    final String inputFiledPlaceHolder = 'PlaceHolderTest';
    final String inputFiledValue = 'ValueTest';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            label: inputFiledLabel,
            placeHolder: inputFiledPlaceHolder,
            value: inputFiledValue,
            onValueChange: (changeValue) {},
          ),
        ),
      ),
    );
    final Finder inputFiledLabelFinder = find.text(inputFiledLabel);
    final Finder inputFiledPlaceHolderFinder = find.text(inputFiledPlaceHolder);
    final Finder inputFiledValueFinder = find.text(inputFiledValue);

    expect(inputFiledLabelFinder, findsOneWidget);
    expect(inputFiledPlaceHolderFinder, findsOneWidget);
    expect(inputFiledValueFinder, findsNothing); // value의 경우 파라미터로 받아서 아무 Widget에도 설정하지 않아서 못찾는다.
  });
  testWidgets('InputField onValueChnage Test', (tester) async {
    final Key inputFiledKey = Key('InputFiledKey');
    final String inputFiledLabel = 'LabelTest';
    final String inputFiledPlaceHolder = 'PlaceHolderTest';
    final String inputFiledValue = 'ValueTest';

    String saveChangeValue = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            key: inputFiledKey,
            label: inputFiledLabel,
            placeHolder: inputFiledPlaceHolder,
            value: inputFiledValue,
            onValueChange: (changeValue) {
              saveChangeValue = changeValue;
            },
          ),
        ),
      ),
    );

    final Finder inputFiledFinder = find.byKey(inputFiledKey);

    await tester.enterText(inputFiledFinder, inputFiledValue);
    await tester.pump();

    expect(saveChangeValue, equals(inputFiledValue));
  });
}

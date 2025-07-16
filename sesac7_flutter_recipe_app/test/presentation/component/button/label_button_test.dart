import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/label.dart';
import 'package:flutter_recipe_app/presentation/component/button/label_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LabelButton Finder Test', (tester) async {
    final String labelButtonTitle = '라벨버튼';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelButton(
            labelName: labelButtonTitle,
            isSelected: false,
            onValueChange: (label) {},
          ),
        ),
      ),
    );

    final Finder labelButtonFinder = find.text(labelButtonTitle);

    expect(labelButtonFinder, findsOneWidget);
  });

  testWidgets('LabelButton onValueChange Test', (tester) async {
    final Key labelButtonKey = Key('LabelButtonKey');
    final String labelButtonTitle = '라벨버튼';
    Label? labelModel;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelButton(
            key: labelButtonKey,
            labelName: labelButtonTitle,
            isSelected: false,
            onValueChange: (label) {
              labelModel = label;
            },
          ),
        ),
      ),
    );

    final Finder labelButtonFinder = find.byKey(labelButtonKey);

    await tester.tap(labelButtonFinder);
    await tester.pump();

    expect(labelModel?.labelTitle, equals(labelButtonTitle));
  });
}

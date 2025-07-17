import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterButton Test', () {
    final String filterTitle = 'filter';
    testWidgets('FilterButton Finder Test', (tester) async {
      bool selectedState = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterButton(
              filterTitle: filterTitle,
              isSelected: selectedState,
              onValueChange: (isSelected) {},
            ),
          ),
        ),
      );
      final Finder filterButtonFinder = find.text(filterTitle);
      expect(filterButtonFinder, findsOneWidget);
    });

    testWidgets('FilterButton onValueChange Test', (tester) async {
      bool selectedState = false;
      final Key filterButtonKey = Key('FilterButtonKey');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterButton(
              key: filterButtonKey,
              filterTitle: filterTitle,
              isSelected: selectedState,
              onValueChange: (isSelected) {
                selectedState = isSelected;
              },
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(filterButtonKey));
      await tester.pump();

      expect(selectedState, isTrue);
    });
  });
}

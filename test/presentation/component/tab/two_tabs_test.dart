import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/tab/two_tabs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final labels = ['Tab 1', 'Tab 2'];
  late int selectedIndex;
  void onValueChange(int index) {
    selectedIndex = index;
  }

  setUp(() {
    selectedIndex = 0;
  });

  group(
    'labels',
    () {
      testWidgets('displays the correct labels.', (tester) async {
        // given

        // when
        await tester.pumpWidget(
          MaterialApp(
            home: TwoTabs(
              labels: labels,
              selectedIndex: selectedIndex,
              onValueChange: onValueChange,
            ),
          ),
        );

        // then
        expect(find.text(labels[0]), findsOneWidget);
        expect(find.text(labels[1]), findsOneWidget);
      });
    },
  );

  group('onValueChange', () {
    testWidgets('calls onValueChange with the correct index.', (tester) async {
      // given
      final expectedIndex = 1;
      await tester.pumpWidget(
        MaterialApp(
          home: TwoTabs(
            labels: labels,
            selectedIndex: selectedIndex,
            onValueChange: onValueChange,
          ),
        ),
      );

      // when
      await tester.tap(find.text(labels[expectedIndex]));
      await tester.pumpAndSettle();

      // then
      expect(selectedIndex, expectedIndex);
    });
  });
}

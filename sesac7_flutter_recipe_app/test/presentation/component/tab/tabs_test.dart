import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/label.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tabs Finder Test', (tester) async {
    final String labelTitle1 = 'Label1';
    final String labelTitle2 = 'Label2';
    final List<Label> labels = [
      Label(labelTitle: labelTitle1),
      Label(labelTitle: labelTitle2),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Tabs(
            labels: labels,
            selectedIndex: 0,
            onValueChange: (index) {},
          ),
        ),
      ),
    );

    final Finder tabsLabel1Finder = find.text(labelTitle1);
    final Finder tabsLabel2Finder = find.text(labelTitle2);

    expect(tabsLabel1Finder, findsOneWidget);
    expect(tabsLabel2Finder, findsOneWidget);
  });
  testWidgets('Tabs onValueChange Test', (tester) async {
    final Key tabsKey = Key('TabsKey');
    final String labelTitle1 = 'Label1';
    final String labelTitle2 = 'Label2';
    final List<Label> labels = [
      Label(labelTitle: labelTitle1),
      Label(labelTitle: labelTitle2),
    ];

    int selectedIndex = -1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Tabs(
            key: tabsKey,
            labels: labels,
            selectedIndex: selectedIndex,
            onValueChange: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    final Finder tabsLabel1Finder = find.text(labelTitle1);
    await tester.tap(tabsLabel1Finder);
    await tester.pump();
    expect(selectedIndex, 0);

    final Finder tabsLabel2Finder = find.text(labelTitle2);
    await tester.tap(tabsLabel2Finder);
    await tester.pump();
    expect(selectedIndex, equals(1));
  });
}

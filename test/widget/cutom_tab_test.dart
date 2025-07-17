import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/tabs/custom_tab.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomTab 위젯 테스트', () {
    final List<Map<String, Object>> testTabData = [
      {'id': 1, 'name': '탭1'},
      {'id': 2, 'name': '탭2'},
      {'id': 3, 'name': '탭3'},
    ];

    testWidgets('CustomTab name 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTab(
              tabData: testTabData,
              selectedTabId: 1,
              onTap: (id) {},
            ),
          ),
        ),
      );

      expect(find.text('탭1'), findsOneWidget);
      expect(find.text('탭2'), findsOneWidget);
      expect(find.text('탭3'), findsOneWidget);
    });

    testWidgets('탭 클릭 onTap id 매칭 테스트', (WidgetTester tester) async {
      int? tappedId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTab(
              tabData: testTabData,
              selectedTabId: 1,
              onTap: (id) {
                tappedId = id;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('탭2'));
      expect(tappedId, 2);

      await tester.tap(find.text('탭1'));
      expect(tappedId, 1);
    });
  });
}
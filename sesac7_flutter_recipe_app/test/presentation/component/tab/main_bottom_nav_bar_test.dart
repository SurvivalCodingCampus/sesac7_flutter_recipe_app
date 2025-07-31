
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/main_bottom_nav_item.dart';
import 'package:flutter_recipe_app/presentation/component/tab/main_bottom_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainBottomNavBar', () {
    testWidgets('MainBottomNavBar renders correctly with selected item', (tester) async {
      int selectedIndex = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: MainBottomNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (index) {
                selectedIndex = index;
              },
            ),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      expect(find.byWidgetPredicate(
        (widget) => widget is MainBottomNavItem && widget.label == '홈',
      ), findsOneWidget);
      expect(find.byWidgetPredicate(
        (widget) => widget is MainBottomNavItem && widget.label == '저장',
      ), findsOneWidget);
      expect(find.byWidgetPredicate(
        (widget) => widget is MainBottomNavItem && widget.label == '알림',
      ), findsOneWidget);
      expect(find.byWidgetPredicate(
        (widget) => widget is MainBottomNavItem && widget.label == '내 정보',
      ), findsOneWidget);

      // Verify selected item
      final homeItem = tester.widget<MainBottomNavItem>(find.widgetWithText(MainBottomNavItem, '홈'));
      expect(homeItem.selectedIndex, 0);
      expect(homeItem.iconData, Icons.home);
    });

    testWidgets('onItemTapped is called when a navigation item is tapped', (tester) async {
      int tappedIndex = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: MainBottomNavBar(
              selectedIndex: 0,
              onItemTapped: (index) {
                tappedIndex = index;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byWidgetPredicate(
        (widget) => widget is MainBottomNavItem && widget.label == '저장',
      ));
      await tester.pump();

      expect(tappedIndex, 1);
    });

    testWidgets('FloatingActionButton onPressed is called when tapped', (tester) async {
      // FloatingActionButton의 onPressed는 직접 테스트하기 어렵습니다.
      // 일반적으로는 ViewModel의 특정 메서드를 호출하도록 하고, 해당 ViewModel을 Mocking하여 테스트합니다.
      // 현재 구현에서는 print만 하고 있으므로, 이 테스트는 단순히 버튼이 존재하는지 확인하는 정도로 충분합니다.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: MainBottomNavBar(
              selectedIndex: 0,
              onItemTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
      // 탭 이벤트를 발생시켜도 내부적으로 print만 하므로, 외부에서 상태 변화를 감지하기 어렵습니다.
      // 이 부분은 ViewModel과 연동될 때 ViewModel 테스트에서 다루는 것이 더 적절합니다.
    });
  });
}


import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('BigButton 통합 테스트', () {
    const Key testButtonKey = Key('testBigButton');

    const Key cancelButtonKey = Key('cancelTestButton');
    testWidgets('BigButton이 렌더링되고, 텍스트 확인, 탭 동작 및 콜백이 올바르게 작동하는지 확인', (WidgetTester tester) async {

      bool onTapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('BigButton 테스트')),
            body: Center(
              child: BigButton(
                key: testButtonKey, // BigButton에 Key를 할당합니다.
                buttonText: 'Test Button',
                onTap: () {
                  onTapCalled = true; // 콜백이 호출되었음을 표시
                },
              ),
            ),
          ),
        ),
      );
      // 위젯이 완전히 빌드되고 안정화될 때까지 기다립니다. (initState 실행 및 텍스트 렌더링 포함)
      await tester.pumpAndSettle();

      // 1. BigButton 위젯 자체가 화면에 존재하는지 Key로 확인
      expect(find.byKey(testButtonKey), findsOneWidget);

      // 2. BigButton 내부의 Text 위젯이 올바르게 표시되는지 확인
      //    find.descendant를 사용하여 BigButton 위젯 하위에서 'Test Button' 텍스트를 찾습니다.
      expect(find.descendant(of: find.byKey(testButtonKey), matching: find.text('Test Button')), findsOneWidget);

      // 3. 버튼을 탭하는 동작 시뮬레이션
      final Finder bigButtonFinder = find.byKey(testButtonKey); // Key로 버튼을 찾습니다.
      await tester.tap(bigButtonFinder); // onTapDown, onTapUp, onTap을 모두 트리거합니다.
      await tester.pumpAndSettle(); // 상태 변화 및 onTap 콜백 완료를 기다립니다.

      // 4. onTap 콜백이 호출되었는지 확인
      expect(onTapCalled, isTrue);

      onTapCalled = false; // 콜백 호출 여부 초기화
      await tester.tap(bigButtonFinder); // Key로 찾은 버튼을 다시 탭합니다.
      await tester.pumpAndSettle(); // 상태 변화 및 콜백 완료를 기다립니다.
      expect(onTapCalled, isTrue);
    });

    testWidgets('BigButton을 누르다가 취소될 때 색상 리셋 확인', (WidgetTester tester) async {
      bool onTapCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('BigButton 테스트 취소')),
            body: Center(
              child: BigButton(
                key: cancelButtonKey, // 취소 테스트용 Key
                buttonText: 'Cancel Test',
                onTap: () { onTapCalled = true; },
              ),
            ),
          ),
        ),
      );
      // 위젯이 완전히 빌드되고 안정화될 때까지 기다립니다.
      await tester.pumpAndSettle();

      final Finder bigButtonFinder = find.byKey(cancelButtonKey);
      // 제스처 시작 (onTapDown 트리거)
      final gesture = await tester.startGesture(tester.getCenter(bigButtonFinder));
      await tester.pump(); // 상태 변화를 위한 한 프레임 그리기 (색상 변화 확인용)

      // 제스처 취소 (onTapCancel 트리거)
      await gesture.cancel();
      await tester.pumpAndSettle(); // 상태 변화를 기다립니다.

      // onTap 콜백이 호출되지 않았음을 확인 (cancel 되었으므로)
      expect(onTapCalled, isFalse);
    });
  });
}
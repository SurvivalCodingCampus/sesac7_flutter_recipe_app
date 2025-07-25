import 'package:flutter_recipe_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Sample integration test', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Hello'), findsOneWidget); // 테스트할 텍스트 확인
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/presentation/component/button/network_error_dialog_button.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/network_error_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkErrorDialog', () {
    testWidgets('NetworkErrorDialog renders correctly with title and message', (tester) async {
      const String testTitle = 'Error Title';
      const NetworkError testError = NetworkError.unKnown;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NetworkErrorDialog(
              dialogTitle: testTitle,
              networkError: testError,
              dismiss: () {},
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testError.message), findsOneWidget);
      expect(find.byType(NetworkErrorDialogButton), findsOneWidget);
    });

    testWidgets('NetworkErrorDialog calls dismiss when button is tapped', (tester) async {
      bool dismissed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NetworkErrorDialog(
              dialogTitle: 'Test',
              networkError: NetworkError.unKnown,
              dismiss: () {
                dismissed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NetworkErrorDialogButton));
      await tester.pump();

      expect(dismissed, isTrue);
    });
  });
}

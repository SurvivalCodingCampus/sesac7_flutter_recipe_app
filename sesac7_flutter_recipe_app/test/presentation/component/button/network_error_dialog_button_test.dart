
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/network_error_dialog_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkErrorDialogButton', () {
    testWidgets('NetworkErrorDialogButton renders correctly', (tester) async {
      const String testTitle = 'Test Button';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NetworkErrorDialogButton(
              buttonTitle: testTitle,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.rating);
      final Text textWidget = tester.widget(find.text(testTitle));
      expect(textWidget.style, TextStyles.networkErrorDialogButtonTitle);
    });

    testWidgets('NetworkErrorDialogButton calls onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NetworkErrorDialogButton(
              buttonTitle: 'Test Button',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NetworkErrorDialogButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

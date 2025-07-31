
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/presentation/component/popup_menu/custom_popup_menu_item.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomPopupMenuItem', () {
    testWidgets('CustomPopupMenuItem renders correctly with data', (tester) async {
      const PopupMenuType testMenuType = PopupMenuType.share;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomPopupMenuItem(
              menuType: testMenuType,
            ),
          ),
        ),
      );

      expect(find.text(testMenuType.title), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);

      final Text textWidget = tester.widget(find.text(testMenuType.title));
      expect(textWidget.style, TextStyles.popupMenuTitle);
    });
  });
}

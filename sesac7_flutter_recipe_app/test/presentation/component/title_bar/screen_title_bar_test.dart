
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/presentation/component/popup_menu/custom_popup_menu_item.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScreenTitleBar', () {
    testWidgets('ScreenTitleBar renders with title and back button', (tester) async {
      bool backButtonPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenTitleBar(
              title: 'Test Title',
              backButtonClick: () {
                backButtonPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byType(PopupMenuButton), findsNothing);

      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(backButtonPressed, isTrue);
    });

    testWidgets('ScreenTitleBar renders with title and popup menu', (tester) async {
      PopupMenuType? selectedMenuType;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenTitleBar(
              title: 'Test Title',
              popupMenuItemClick: (type) {
                selectedMenuType = type;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byType(PopupMenuButton), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_horiz));
      await tester.pumpAndSettle(); // Wait for the menu to open

      expect(find.byType(CustomPopupMenuItem), findsNWidgets(4));

      await tester.tap(find.text(PopupMenuType.share.title));
      await tester.pumpAndSettle();

      expect(selectedMenuType, PopupMenuType.share);
    });

    testWidgets('ScreenTitleBar renders only with title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenTitleBar(
              title: 'Test Title',
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byType(PopupMenuButton), findsNothing);
    });

    testWidgets('ScreenTitleBar renders only with back button', (tester) async {
      bool backButtonPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenTitleBar(
              backButtonClick: () {
                backButtonPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsNothing);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byType(PopupMenuButton), findsNothing);

      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(backButtonPressed, isTrue);
    });

    testWidgets('ScreenTitleBar renders only with popup menu', (tester) async {
      PopupMenuType? selectedMenuType;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenTitleBar(
              popupMenuItemClick: (type) {
                selectedMenuType = type;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsNothing);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byType(PopupMenuButton), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_horiz));
      await tester.pumpAndSettle(); // Wait for the menu to open

      expect(find.byType(CustomPopupMenuItem), findsNWidgets(4));

      await tester.tap(find.text(PopupMenuType.rateRecipe.title));
      await tester.pumpAndSettle();

      expect(selectedMenuType, PopupMenuType.rateRecipe);
    });
  });
}

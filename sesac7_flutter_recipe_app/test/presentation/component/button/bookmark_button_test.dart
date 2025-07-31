
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookmarkButton', () {
    testWidgets('BookmarkButton renders correctly when not selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookmarkButton(
              isSelected: false,
              onBookmarkPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.bookmark_border_rounded), findsOneWidget);
      final Icon icon = tester.widget(find.byIcon(Icons.bookmark_border_rounded));
      expect(icon.color, AppColors.gray3);
    });

    testWidgets('BookmarkButton renders correctly when selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookmarkButton(
              isSelected: true,
              onBookmarkPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.bookmark_border_rounded), findsOneWidget);
      final Icon icon = tester.widget(find.byIcon(Icons.bookmark_border_rounded));
      expect(icon.color, AppColors.primary80);
    });

    testWidgets('BookmarkButton calls onBookmarkPressed when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookmarkButton(
              isSelected: false,
              onBookmarkPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BookmarkButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

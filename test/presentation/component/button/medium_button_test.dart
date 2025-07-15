import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedText = 'Button';

  testWidgets('should have correct colors', (tester) async {
    // given
    await tester.pumpWidget(
      MaterialApp(
        home: MediumButton(text: expectedText, onClick: () {}),
      ),
    );

    // when
    final container = find.byType(Container);
    final containerWidget = tester.widget<Container>(container.first);
    final decoration = containerWidget.decoration as BoxDecoration;

    // then
    expect(decoration.color, AppColors.primary100);
    expect(decoration.borderRadius, BorderRadius.circular(10));
  });

  testWidgets('should display arrow forward icon', (tester) async {
    // given
    // when
    await tester.pumpWidget(
      MaterialApp(
        home: MediumButton(text: expectedText, onClick: () {}),
      ),
    );

    // then
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  group('text', () {
    testWidgets('Text displays the expectedText value.', (tester) async {
      // given

      // when
      await tester.pumpWidget(
        MaterialApp(
          home: MediumButton(
            text: expectedText,
            onClick: () {},
          ),
        ),
      );

      // then
      expect(find.text(expectedText), findsOneWidget);
    });

    testWidgets('should truncate long text with ellipsis', (tester) async {
      // given
      final longText =
          'This is a very long text that should be truncated with ellipsis';

      // when
      await tester.pumpWidget(
        MaterialApp(
          home: MediumButton(text: longText, onClick: () {}),
        ),
      );
      final textWidget = tester.widget<Text>(find.text(longText));

      // then
      expect(textWidget.overflow, TextOverflow.ellipsis);
      expect(textWidget.maxLines, 1);
    });
  });

  group('onClick', () {
    testWidgets('onClick is called when the button is tapped.', (tester) async {
      // given
      bool wasTapped = false;
      void onClick() {
        wasTapped = true;
      }

      // when
      await tester.pumpWidget(
        MaterialApp(
          home: MediumButton(
            text: expectedText,
            onClick: onClick,
          ),
        ),
      );
      expect(wasTapped, isFalse);
      await tester.tap(find.byType(MediumButton));

      // then
      expect(wasTapped, isTrue);
    });
  });
}

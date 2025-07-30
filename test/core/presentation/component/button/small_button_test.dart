import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedText = 'Button';

  testWidgets('should have correct fixed dimensions', (tester) async {
    // given
    // when
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallButton(text: expectedText, onClick: () {}),
        ),
      ),
    );
    final buttonFinder = find.byType(SmallButton);
    final Size buttonSize = tester.getSize(buttonFinder);

    // then
    expect(buttonSize.height, SmallButton.height);
  });

  testWidgets('should have correct colors', (tester) async {
    // given
    await tester.pumpWidget(
      MaterialApp(
        home: SmallButton(text: expectedText, onClick: () {}),
      ),
    );

    // when
    final container = find.byType(Container);
    final containerWidget = tester.widget<Container>(container.first);
    final decoration = containerWidget.decoration as BoxDecoration;

    // then
    expect(decoration.color, AppColors.primary100);
    expect(
      decoration.borderRadius,
      BorderRadius.circular(ComponentConstant.borderRadius),
    );
  });

  group('text', () {
    testWidgets('Text displays the expectedText value.', (tester) async {
      // given

      // when
      await tester.pumpWidget(
        MaterialApp(
          home: SmallButton(
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
          home: SmallButton(text: longText, onClick: () {}),
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
          home: SmallButton(
            text: expectedText,
            onClick: onClick,
          ),
        ),
      );
      expect(wasTapped, isFalse);
      await tester.tap(find.byType(SmallButton));

      // then
      expect(wasTapped, isTrue);
    });
  });
}

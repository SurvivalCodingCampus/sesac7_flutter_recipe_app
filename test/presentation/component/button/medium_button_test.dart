import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedText = 'Button';

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

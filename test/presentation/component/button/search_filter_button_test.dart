import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchFilterButton Widget Test', () {
    testWidgets('should display correctly and handle taps',
        (WidgetTester tester) async {
      // Given
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchFilterButton(
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      // Then: Verify the initial state
      final container = tester.widget<Container>(find.descendant(
        of: find.byType(SearchFilterButton),
        matching: find.byType(Container),
      ));
      final decoration = container.decoration as BoxDecoration;
      final icon = tester.widget<Icon>(find.byType(Icon));

      // Check the icon
      expect(find.byIcon(Icons.format_line_spacing_outlined), findsOneWidget);

      // Check the colors
      expect(decoration.color, AppColors.primary100);
      expect(icon.color, AppColors.white);

      // Check that it has not been tapped yet
      expect(wasTapped, isFalse);

      // When: The button is tapped
      await tester.tap(find.byType(SearchFilterButton));
      await tester.pump();

      // Then: The onTap callback should have been called
      expect(wasTapped, isTrue);
    });
  });
}

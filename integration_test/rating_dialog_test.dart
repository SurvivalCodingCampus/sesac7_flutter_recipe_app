import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful_widget/presentation/component/rating_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('RatingDialog integration test', (WidgetTester tester) async {
    int? selectedRating;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatingDialog(
            title: 'Rate this item',
            actionName: 'Submit',
            onChange: (rating) {
              selectedRating = rating;
            },
          ),
        ),
      ),
    );

    final fourthStar = find.byIcon(Icons.star_border).at(3);
    await tester.tap(fourthStar);
    await tester.pump();

    expect(find.byIcon(Icons.star), findsNWidgets(4));
    expect(find.byIcon(Icons.star_border), findsNWidgets(1));

    final submitButton = find.text('Submit');
    await tester.tap(submitButton);
    await tester.pump();

    expect(selectedRating, equals(4));
  });
}

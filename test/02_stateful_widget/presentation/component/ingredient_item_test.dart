import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/ingredient.dart';
import 'package:flutter_recipe_app/02_stateful_widget/presentation/component/ingredient_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('IngredientItem renders correctly', (tester) async {
    await mockNetworkImagesFor(() async {
      // given
      final Ingredient ingredient = Ingredient(
        id: 1,
        name: 'Tomatos',
        image:
            'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
      );
      final int quantity = 500;
      final testKey = 'testKeyIngredientItem';

      await tester.pumpWidget(
        MaterialApp(
          key: Key(testKey),
          home: IngredientItem(ingredient: ingredient, quantity: quantity),
        ),
      );

      // when & then
      expect(find.byType(IngredientItem), findsOneWidget);
      expect(find.byKey(Key(testKey)), findsOneWidget);

      expect(find.text('Tomatos'), findsOneWidget);
      expect(find.text('500g'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/label_type.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_thumbnail_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/step_card.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientScreen', () {
    final testRecipe = Recipe(
      id: 1,
      name: 'Delicious Test Recipe',
      image: 'https://example.com/test_image.jpg',
      category: 'Test',
      chef: 'Test Chef',
      time: '30 min',
      rating: 4.5,
      ingredients: [
        Ingredients(
          ingredient: Ingredient(id: 1, name: 'Onion', image: 'onion.jpg'),
          amount: 100,
        ),
        Ingredients(
          ingredient: Ingredient(id: 2, name: 'Tomato', image: 'tomato.jpg'),
          amount: 200,
        ),
      ],
    );

    final testProcedures = [
      Procedure(recipeId: 1, step: 1, content: 'Step 1: Prepare ingredients'),
      Procedure(recipeId: 1, step: 2, content: 'Step 2: Cook the dish'),
    ];

    testWidgets('IngredientScreen renders correctly with recipe data', (
      tester,
    ) async {
      final IngredientState initialState = IngredientState(
        currentSelectedRecipe: testRecipe,
        selectedLabelIndex: 0,
        currentSelectedRecipeProcedures: testProcedures,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: IngredientScreen(
            ingredientState: initialState,
            onAction: (action) {},
          ),
        ),
      );

      expect(find.byType(ScreenTitleBar), findsOneWidget);
      expect(find.byType(RecipeThumbnailCard), findsOneWidget);
      expect(find.text(testRecipe.name), findsOneWidget);
      expect(find.text('Laura wilson'), findsOneWidget);
      expect(find.text('Logos, Nigeria'), findsOneWidget);
      expect(find.byType(Tabs), findsOneWidget);
      expect(
        find.text('${testRecipe.ingredients.length} items'),
        findsOneWidget,
      );
      expect(
        find.byType(IngredientCard),
        findsNWidgets(testRecipe.ingredients.length),
      );
      expect(find.byType(StepCard), findsNothing);
    });

    testWidgets(
      'IngredientScreen displays procedures when selectedLabelIndex is 1',
      (tester) async {
        final IngredientState initialState = IngredientState(
          currentSelectedRecipe: testRecipe,
          selectedLabelIndex: 1,
          currentSelectedRecipeProcedures: testProcedures,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: IngredientScreen(
              ingredientState: initialState,
              onAction: (action) {},
            ),
          ),
        );

        expect(find.text('${testProcedures.length} Steps'), findsOneWidget);
        expect(find.byType(StepCard), findsNWidgets(testProcedures.length));
        expect(find.byType(IngredientCard), findsNothing);
      },
    );

    testWidgets('onAction is called when back button is tapped', (
      tester,
    ) async {
      IngredientAction? capturedAction;
      await tester.pumpWidget(
        MaterialApp(
          home: IngredientScreen(
            ingredientState: const IngredientState(),
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pump();

      expect(
        capturedAction,
        const IngredientAction.clickIngredientBackButton(),
      );
    });

    testWidgets('onAction is called when popup menu item is tapped', (
      tester,
    ) async {
      IngredientAction? capturedAction;
      await tester.pumpWidget(
        MaterialApp(
          home: IngredientScreen(
            ingredientState: const IngredientState(),
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_horiz));
      await tester.pumpAndSettle();

      await tester.tap(find.text(PopupMenuType.share.title));
      await tester.pumpAndSettle();

      expect(
        capturedAction,
        const IngredientAction.clickPopupMenuItem(PopupMenuType.share),
      );
    });

    testWidgets('onAction is called when tab is changed', (tester) async {
      IngredientAction? capturedAction;
      await tester.pumpWidget(
        MaterialApp(
          home: IngredientScreen(
            ingredientState: const IngredientState(),
            onAction: (action) {
              capturedAction = action;
            },
          ),
        ),
      );

      await tester.tap(find.text(LabelType.procedure.labelValue));
      await tester.pump();

      expect(
        capturedAction,
        const IngredientAction.changeIngredientTapSelectedIndex(1),
      );
    });
  });
}

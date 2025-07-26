import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/di/di_setup.dart';
import 'package:flutter_recipe_app/presentation/component/card/dish_card.dart';
import 'package:flutter_recipe_app/presentation/component/control/recipe_category_selector.dart';
import 'package:flutter_recipe_app/presentation/screen/main_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/main_screen_root.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    diSetup();
  });

  // group 설명을 한글로
  group('메인 화면 통합 테스트 (MockRecipeDataSource 사용)', () {
    // testWidgets 설명을 한글로
    testWidgets(
      '초기 화면이 올바르게 로드되고 MockDataSource의 데이터가 표시됩니다.',
          (WidgetTester tester) async {
        final testViewModel = getIt<RecipeHomeViewModel>();

        await tester.pumpWidget(MaterialApp(
          home: MainScreenRoot(homeRecipeViewModel: testViewModel),
        ));

        await tester.pumpAndSettle(const Duration(seconds: 2));

        expect(find.text('Hello Jega'), findsOneWidget);
        expect(find.text('What are you cooking today?'), findsOneWidget);
        expect(find.byType(MainScreen), findsOneWidget);


        if (testViewModel.state.categories.isNotEmpty && testViewModel.state.filteredRecipes.isNotEmpty) {
          final firstRecipeName = testViewModel.state.filteredRecipes.first.name;
          expect(find.text(firstRecipeName), findsOneWidget,
              reason: '첫 번째 레시피 이름이 화면에 보여야 합니다.');

          await tester.pumpAndSettle();

          expect(find.byType(RecipeCategorySelector), findsOneWidget);
          if (testViewModel.state.categories.isNotEmpty) {
            final initialCategory = testViewModel.state.selectedCategory;
            expect(initialCategory, isNotNull, reason: '초기 선택된 카테고리가 null이 아니어야 합니다.');
            expect(
                find.descendant(
                    of: find.byType(RecipeCategorySelector),
                    matching: find.text(initialCategory)
                ),
                findsOneWidget,
                reason: '선택된 카테고리($initialCategory)가 카테고리 선택기에 보여야 합니다.'
            );
          }

          final initialRecipes = testViewModel.state.filteredRecipes;
          if (initialRecipes.isNotEmpty) {
            final dishCardListFinder = find.byWidgetPredicate(
                  (widget) =>
              widget is ListView &&
                  widget.scrollDirection == Axis.horizontal &&
                  widget.semanticChildCount == initialRecipes.length,
              description: 'DishCard를 보여주는 가로 스크롤 ListView', // description을 한글로
            ).last;

            expect(dishCardListFinder, findsOneWidget, reason: "DishCard를 위한 가로 목록이 화면에 있어야 합니다.");

            expect(find.widgetWithText(DishCard, initialRecipes.first.name), findsOneWidget,
                reason: '초기 레시피 목록의 첫 번째 DishCard(${initialRecipes.first.name})가 화면에 보여야 합니다.');
          } else {
            expect(find.byType(DishCard), findsNothing, reason: '초기 레시피가 없으면 DishCard가 화면에 없어야 합니다.');
          }
        }
      },
    );
  });
}

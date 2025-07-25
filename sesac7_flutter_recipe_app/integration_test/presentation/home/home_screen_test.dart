import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/selector/recipe_category_selector.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/home/home_action.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HomeScreen', () {
    // 테스트용 Ingredient 및 Ingredients 더미 데이터 생성 함수
    Ingredient createDummyIngredient(num id, String name, String image) {
      return Ingredient(id: id, name: name, image: image);
    }

    Ingredients createDummyRecipeIngredient(Ingredient ingredient, int amount) {
      return Ingredients(ingredient: ingredient, amount: amount);
    }

    testWidgets('Verify initial UI elements are rendered correctly', (WidgetTester tester) async {
      // 초기 상태 설정
      final HomeState initialState = HomeState(
        categories: {'Indian', 'Asian'},
        category: 'All',
        categoryRecipes: [
          Recipe(
            id: 1,
            name: 'Traditional spare ribs baked',
            image: 'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
            chef: 'Chef John',
            time: '20 min',
            rating: 4.0,
            category: 'Indian',
            ingredients: [
              createDummyRecipeIngredient(
                createDummyIngredient(3, 'Pork', 'https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg'),
                500,
              ),
              createDummyRecipeIngredient(
                createDummyIngredient(9, 'Onion', 'https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg'),
                50,
              ),
            ],
          ),
          Recipe(
            id: 2,
            name: 'Spice roasted chicken with flavored rice',
            image: 'https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg',
            chef: 'Mark Kelvin',
            time: '20 min',
            rating: 4.0,
            category: 'Asian',
            ingredients: [
              createDummyRecipeIngredient(
                createDummyIngredient(6, 'Chicken', 'https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg'),
                300,
              ),
              createDummyRecipeIngredient(
                createDummyIngredient(4, 'Rice', 'https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg'),
                200,
              ),
            ],
          ),
        ],
      );

      // HomeScreen 위젯 빌드
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: initialState,
            onAction: (action) {}, // 액션은 테스트 시뮬레이션에 사용될 것
          ),
        ),
      );

      // 위젯들이 화면에 있는지 확인
      expect(find.text('Hello Jega'), findsOneWidget);
      expect(find.text('What are you cooking today?'), findsOneWidget);
      expect(find.byType(SearchInputField), findsOneWidget);
      expect(find.byType(SearchRecipeFilterButton), findsOneWidget);
      expect(find.byType(RecipeCategorySelector), findsOneWidget);

      // 카테고리 셀렉터에 'All', 'Indian', 'Asian' 보이는지 확인
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Indian'), findsOneWidget);
      expect(find.text('Asian'), findsOneWidget);

      // 레시피 카드들이 렌더링되었는지 확인
      expect(find.text('Traditional spare ribs baked'), findsOneWidget);
      expect(find.text('Spice roasted chicken with flavored rice'), findsOneWidget);

      await tester.pumpAndSettle(); // 모든 애니메이션이 완료될 때까지 대기
    });

    testWidgets('Confirms HomeAction.selectCategory is called on category selection', (
      WidgetTester tester,
    ) async {
      // HomeAction을 캡처하기 위한 Mock 함수
      HomeAction? capturedAction;
      void onActionMock(HomeAction action) {
        capturedAction = action;
      }

      final HomeState initialState = HomeState(
        categories: {'Indian', 'Asian'},
        category: 'All',
        categoryRecipes: [], // 레시피는 이 테스트에서 중요하지 않음
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: initialState,
            onAction: onActionMock,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 'Korean' 카테고리 텍스트를 찾아서 탭
      final koreanCategoryFinder = find.text('Indian');
      expect(koreanCategoryFinder, findsOneWidget);
      await tester.tap(koreanCategoryFinder);
      await tester.pumpAndSettle(); // UI 업데이트 대기

      // onAction이 HomeAction.selectCategory('Korean')으로 호출되었는지 확인
      expect(capturedAction, isA<SelectCategory>());
      expect((capturedAction as SelectCategory).category, 'Indian');
    });

    testWidgets('Verifies SearchRecipeFilterBottomSheet is displayed on filter button tap', (
      WidgetTester tester,
    ) async {
      final HomeState initialState = HomeState(
        categories: {},
        category: 'All',
        categoryRecipes: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            state: initialState,
            onAction: (action) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // SearchRecipeFilterButton 찾기
      final filterButtonFinder = find.byType(SearchRecipeFilterButton);
      expect(filterButtonFinder, findsOneWidget);

      // 버튼 탭
      await tester.tap(filterButtonFinder);
      await tester.pumpAndSettle(); // BottomSheet가 올라오는 애니메이션 대기

      // SearchRecipeFilterBottomSheet가 화면에 표시되었는지 확인
      expect(find.byType(SearchRecipeFilterBottomSheet), findsOneWidget);

      // BottomSheet 닫기 (예: 뒤로 가기 키 시뮬레이션)
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      // BottomSheet가 사라졌는지 확인
      expect(find.byType(SearchRecipeFilterBottomSheet), findsNothing);
    });
  });
}

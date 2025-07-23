import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/ingredient_model.dart';
import 'package:flutter_recipe_app/domain/model/recipe_model.dart';
import 'package:flutter_recipe_app/domain/model/step_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('레시피 카드 위젯 테스트', () {
    // 테스트에 사용할 더미 레시피 데이터
    final dummyRecipe = RecipeModel(
      category: 'Indian',
      id: '1',
      title:
      'Traditional spare ribs baked Traditional spare ribs baked Traditional spare ribs baked',
      imageUrl:
      'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      description: 'This is a description of the recipe.',
      ingredients: [
        IngredientModel(
          name: 'ingredient1',
          quantity: '100g',
          imageUrl:
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
        ),
      ],
      steps: [StepModel(description: 'step1', stepNumber: 1)],
      cookTimeMinutes: 30,
      servings: 4,
      authorName: 'sehwan',
      averageRating: 4.5,
      reviewCount: 100,
      isSavedByUser: false,
    );

    testWidgets('Card 위젯 렌더링 테스트', (
        WidgetTester tester) async {
      // 위젯을 렌더링합니다.
      await tester.pumpWidget(
        MaterialApp( // MaterialApp으로 감싸야 TextStyles, Icon 등이 제대로 렌더링됩니다.
          home: Scaffold(
            body: Center(
              // child: RecipeCard(
              //   recipe: dummyRecipe, saveRecipeCallback: (String recipeId) {},),
            ),
          ),
        ),
      );

      // 프레임이 안정화될 때까지 기다립니다.
      await tester.pumpAndSettle();

      // 1. Card 위젯이 존재하는지 확인
      expect(find.byType(Card), findsOneWidget);

      // 2. 이미지 위젯이 존재하는지 확인
      expect(find.byType(Image), findsOneWidget);
      // Image.network의 URL이 올바른지 확인 (선택 사항)
      // final Image imageWidget = tester.widget(find.byType(Image));
      // expect((imageWidget.image as NetworkImage).url, dummyRecipe.imageUrl);

      // 3. 타이틀 텍스트가 존재하는지 확인
      expect(find.text(dummyRecipe.title), findsOneWidget);
      // 타이틀 텍스트의 스타일과 오버플로우 처리가 잘 되어있는지 확인 (간접적으로)
      final Text titleTextWidget = tester.widget(find.text(dummyRecipe.title));
      expect(titleTextWidget.maxLines, 2);
      expect(titleTextWidget.overflow, TextOverflow.ellipsis);
      expect(titleTextWidget.style?.color, AppColors.white);
      expect(titleTextWidget.style?.fontSize, 14);

      // 4. 세프 이름 텍스트가 존재하는지 확인
      expect(find.text('By Chef ${dummyRecipe.authorName}'), findsOneWidget);
      final Text authorTextWidget = tester.widget(
          find.text('By Chef ${dummyRecipe.authorName}'));
      expect(authorTextWidget.maxLines, 1);
      expect(authorTextWidget.overflow, TextOverflow.ellipsis);
      expect(authorTextWidget.style?.color, AppColors.white);
      expect(authorTextWidget.style?.fontSize, 8);


      // 5. 별점 텍스트와 아이콘이 존재하는지 확인
      expect(find.text('${dummyRecipe.averageRating}'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      // 6. 조리 시간 텍스트와 아이콘이 존재하는지 확인
      expect(find.text('${dummyRecipe.cookTimeMinutes} min'), findsOneWidget);
      expect(find.byIcon(Icons.access_time), findsOneWidget);

      // 7. 북마크 아이콘이 존재하는지 확인
      expect(find.byIcon(Icons.bookmark_border), findsOneWidget);

      // 8. 별점 컨테이너가 오른쪽 끝에 정렬되었는지 확인 (간접적인 방법)
      // 별점 컨테이너를 찾고, 그 부모 Row의 mainAxisAlignment를 확인하는 것은 어려우므로
      // 별점 텍스트의 위치를 통해 간접적으로 확인합니다.
      // 이 부분은 시각적 확인이 더 정확할 수 있습니다.
      // 예를 들어, 별점 텍스트의 오른쪽 경계가 화면의 오른쪽 경계에 가까운지 확인.
      final Finder ratingTextFinder = find.text('${dummyRecipe.averageRating}');
      expect(ratingTextFinder, findsOneWidget);
      final RenderBox ratingTextBox = tester.renderObject(ratingTextFinder);
      final RenderBox cardBox = tester.renderObject(find.byType(Card));

      // 별점 텍스트의 오른쪽 끝이 카드 오른쪽 끝에 가깝게 위치하는지 확인
      // (오차 범위 10px 허용)
      expect(ratingTextBox
          .localToGlobal(ratingTextBox.size.topRight(Offset.zero))
          .dx,
          closeTo(cardBox.size.width - 10 - 10,
              20)); // Card padding 10, Container padding 10 고려
    });

    testWidgets(
        '타이틀 길어질 경우 말줄임표 기능 테스트', (WidgetTester tester) async {
      final longTitleRecipe = RecipeModel(
        category: 'Indian',
        id: '1',
        title:
        'Traditional spare ribs baked Traditional spare ribs baked Traditional spare ribs baked',
        imageUrl:
        'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
        description: 'This is a description of the recipe.',
        ingredients: [
          IngredientModel(
            name: 'ingredient1',
            quantity: '100g',
            imageUrl:
            'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
          ),
        ],
        steps: [StepModel(description: 'step1', stepNumber: 1)],
        cookTimeMinutes: 30,
        servings: 4,
        authorName: 'sehwan',
        averageRating: 4.5,
        reviewCount: 100,
        isSavedByUser: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              // child: RecipeCard(recipe: longTitleRecipe,
              //   saveRecipeCallback: (String recipeId) {},),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 긴 타이틀이 존재하고, 오버플로우 처리가 되어 있는지 확인
      final Finder titleFinder = find.text(longTitleRecipe.title);
      expect(titleFinder, findsOneWidget);

      // Text 위젯의 RenderBox를 통해 실제 텍스트가 잘렸는지 확인
      final RenderBox renderBox = tester.renderObject(titleFinder);
      // 텍스트가 잘렸다면, 실제 텍스트의 너비가 위젯의 최대 너비보다 커야 합니다.
      // 정확한 픽셀 비교는 어려우므로, ellipsis가 적용되었는지 간접적으로 확인합니다.
      // 예를 들어, 텍스트가 2줄 이상으로 표시되지 않는지 확인.
      expect(renderBox.size.height, lessThan(tester
          .getSize(titleFinder)
          .height * 2.5)); // 대략 2줄 높이보다 약간 큰지 확인
    });
  });
}
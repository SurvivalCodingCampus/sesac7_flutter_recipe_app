import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/ingredient_model.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('IngredientItem displays image, name and quantity',
          (WidgetTester tester) async {
        // 테스트용 Ingredient 모델 생성
        final testIngredient = IngredientModel(
          name: 'Avocado',
          quantity: '500g',
          imageUrl: 'https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg',
        );

        // Image.network를 mock 처리해서 테스트 오류 방지
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: IngredientItem(ingredient: testIngredient),
              ),
            ),
          );

          // 이름 텍스트가 표시되는지 확인
          expect(find.text('Avocado'), findsOneWidget);

          // 수량 텍스트가 표시되는지 확인
          expect(find.text('500g'), findsOneWidget);

          // 이미지가 존재하는지 확인 (Image.network는 semanticLabel 없으면 직접 확인은 어려움)
          expect(find.byType(Image), findsOneWidget);
        });
      });
}

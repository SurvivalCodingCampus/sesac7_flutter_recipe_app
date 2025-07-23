import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_recipes_view_model_test.mocks.dart'; // ChangeNotifier를 위해 필요

// mockito를 사용하여 RecipeRepository 목(Mock) 객체 생성
@GenerateMocks([RecipeRepository])
void main() {
  late RecipeRepository mockRecipeRepository;
  late SavedRecipesViewModel viewModel;

  final mockRecipes = [
    Recipe(
      category: '한식',
      id: 101,
      name: '김치찌개',
      imageUrl: 'https://example.com/kimchijjigae.jpg',
      chef: '김셰프',
      time: '30분',
      rating: 4.5,
    ),
    Recipe(
      category: '양식',
      id: 102,
      name: '스테이크',
      imageUrl: 'https://example.com/steak.jpg',
      chef: '박셰프',
      time: '45분',
      rating: 4.8,
    ),
    Recipe(
      category: '일식',
      id: 103,
      name: '초밥',
      imageUrl: 'https://example.com/sushi.jpg',
      chef: '이셰프',
      time: '20분',
      rating: 4.2,
    ),
  ];

  setUpAll(() {
    provideDummy<Result<List<Recipe>>>(Result.success([]));
  });

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    viewModel = SavedRecipesViewModel(_recipeRepository: mockRecipeRepository);
  });

  group('SavedRecipesViewModel', () {
    test('초기 상태는 로딩 중이 아니고 에러 메시지도 없으며 레시피 목록은 비어 있어야 합니다.', () {
      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, isNull);
      expect(viewModel.recipes, isEmpty);
    });

    test('fetchRecipes 성공 시: 레시피 목록이 업데이트되고 로딩 상태가 false가 되어야 합니다.', () async {
      // RecipeRepository의 getRecipes 메소드가 Success를 반환하도록 설정
      when(
        mockRecipeRepository.getRecipes(),
      ).thenAnswer((_) async => Result<List<Recipe>>.success(mockRecipes));

      await viewModel.fetchRecipes();

      // 레시피 목록이 올바르게 업데이트되었는지 확인
      expect(viewModel.recipes, mockRecipes);
      // 로딩 상태가 false가 되었는지 확인
      expect(viewModel.isLoading, false);
      // 에러 메시지가 없는지 확인
      expect(viewModel.errorMessage, isNull);
    });

    test('fetchRecipes 실패 시: 에러 메시지가 설정되고 로딩 상태가 false가 되어야 합니다.', () async {
      const errorMessage = '레시피를 불러오는데 실패했습니다.';

      // RecipeRepository의 getRecipes 메소드가 Error를 반환하도록 설정
      when(
        mockRecipeRepository.getRecipes(),
      ).thenAnswer((_) async => Result<List<Recipe>>.error(errorMessage));

      await viewModel.fetchRecipes();

      // 레시피 목록이 비어 있는지 확인 (업데이트되지 않음)
      expect(viewModel.recipes, isEmpty);
      // 로딩 상태가 false가 되었는지 확인
      expect(viewModel.isLoading, false);
      // 에러 메시지가 올바르게 설정되었는지 확인
      expect(viewModel.errorMessage, errorMessage);
    });

    test('fetchRecipes 성공 후 실패 시: 에러 메시지가 설정되고 로딩 상태가 false가 되어야 합니다.', () async {
      when(
        mockRecipeRepository.getRecipes(),
      ).thenAnswer((_) async => Result<List<Recipe>>.success(mockRecipes));

      await viewModel.fetchRecipes();

      expect(viewModel.recipes, isNotEmpty);

      // ======== 여기까지 성공

      const errorMessage = '레시피를 불러오는데 실패했습니다.';

      // RecipeRepository의 getRecipes 메소드가 Error를 반환하도록 설정
      when(
        mockRecipeRepository.getRecipes(),
      ).thenAnswer((_) async => Result<List<Recipe>>.error(errorMessage));

      await viewModel.fetchRecipes();

      // 레시피 목록이 비어 있는지 확인 (업데이트되지 않음)
      expect(viewModel.recipes, isEmpty);
      // 로딩 상태가 false가 되었는지 확인
      expect(viewModel.isLoading, false);
      // 에러 메시지가 올바르게 설정되었는지 확인
      expect(viewModel.errorMessage, errorMessage);
    });
  });
}

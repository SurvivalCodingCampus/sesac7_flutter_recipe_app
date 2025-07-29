import 'package:flutter_recipe_app/data/model/user.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';
import '../model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    // 이제 Repository는 User 객체를 직접 생성하지 않고 userId만 반환합니다.
    // ViewModel에서 User 정보를 조합합니다.
    // 이 예제에서는 편의상 Recipe 모델을 그대로 사용하지만,
    // 실제로는 User가 없는 별도의 DTO(Data Transfer Object)를 사용하는 것이 좋습니다.
    final dummyUser = User(id: '', name: '', profileImageUrl: '', location: '');
    return [
      Recipe(
        id: '1',
        recipeName: 'Classic Greek Salad',
        imageUrl: 'https://placehold.co/150x150/E8F5E9/000000?text=Salad',
        cookingTime: '15 Mins',
        rating: 4.5,
        userId: 'jega',
        author: dummyUser,
      ),
      Recipe(
        id: '2',
        recipeName: 'Crunchy Nut Coleslaw',
        imageUrl: 'https://placehold.co/150x150/FFF3E0/000000?text=Coleslaw',
        cookingTime: '10 Mins',
        rating: 3.5,
        userId: 'jega',
        author: dummyUser,
      ),
      Recipe(
        id: '3',
        recipeName: 'Spicy Chicken Curry',
        imageUrl: 'https://placehold.co/150x150/FFEBEE/000000?text=Curry',
        cookingTime: '30 Mins',
        rating: 4.8,
        userId: 'jega',
        author: dummyUser,
      ),
      Recipe(
        id: '4',
        recipeName: 'Steak with tomato sauce',
        imageUrl: 'https://placehold.co/100x100/D7CCC8/000000?text=Steak',
        cookingTime: '20 mins',
        rating: 4.2,
        userId: 'james',
        author: dummyUser,
      ),
      Recipe(
        id: '5',
        recipeName: 'Pilaf sweet with lamb',
        imageUrl: 'https://placehold.co/100x100/CFD8DC/000000?text=Pilaf',
        cookingTime: '35 mins',
        rating: 4.9,
        userId: 'laura',
        author: dummyUser,
      ),
    ];
  }
}

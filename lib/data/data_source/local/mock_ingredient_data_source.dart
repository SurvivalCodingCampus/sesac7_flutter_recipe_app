/// 서버로부터 받아오는 로직 필요

import '../../model/ingredient.dart';
import '../../model/ingredients.dart';

class MockIngredientDataSource{
  final List<Ingredients> items = [
    const Ingredients(
      amount: 100,
      ingredient: Ingredient(
        id: 1,
        name: 'Tomato',
        imageUrl: 'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
      ),
    ),
    const Ingredients(
      amount: 500,
      ingredient: Ingredient(
        id: 3,
        name: 'Pork',
        imageUrl: 'https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg',
      ),
    ),
    const Ingredients(
      amount: 100,
      ingredient: Ingredient(
        id: 9,
        name: 'Onion',
        imageUrl: 'https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg',
      ),
    ),
  ];
}
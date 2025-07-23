import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe_fragment.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/ingredient.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_detail_fragment_repository.dart';

class MockRecipeDetailRepositoryImpl implements RecipeDetailFragmentRepository {

  final List<DetailedRecipeFragment> _recipeFragments = [
    DetailedRecipeFragment(
      id: 0,
      authorId: 0,
      procedures: ["first 11111step", "second step", "third step", "fourth step",],
      ingredients: [
        Ingredient(
          name: "tomato",
          image: "https://placehold.co/100x100.jpg",
          amount: 100
        ),
        Ingredient(
            name: "potato",
            image: "https://placehold.co/100x100.jpg",
            amount: 200
        ),
        Ingredient(
            name: "meat",
            image: "https://placehold.co/100x100.jpg",
            amount: 300
        ),

      ],
      reviewCount: 111,
    ),
    DetailedRecipeFragment(
      id: 1,
      authorId: 1,
      procedures: ["first 2222222step", "second step", "third step", "fourth step",],
      ingredients: [
        Ingredient(
            name: "tomato",
            image: "https://placehold.co/100x100.jpg",
            amount: 100
        ),
        Ingredient(
            name: "potato",
            image: "https://placehold.co/100x100.jpg",
            amount: 200
        ),
        Ingredient(
            name: "meat",
            image: "https://placehold.co/100x100.jpg",
            amount: 300
        ),

      ],
      reviewCount: 222,
    ),
    DetailedRecipeFragment(
      id: 2,
      authorId: 2,
      procedures: ["first 333333333step", "second step", "third step", "fourth step",],
      ingredients: [
        Ingredient(
            name: "tomato",
            image: "https://placehold.co/100x100.jpg",
            amount: 100
        ),
        Ingredient(
            name: "potato",
            image: "https://placehold.co/100x100.jpg",
            amount: 200
        ),
        Ingredient(
            name: "meat",
            image: "https://placehold.co/100x100.jpg",
            amount: 300
        ),

      ],
      reviewCount: 333,
    ),
    DetailedRecipeFragment(
      id: 3,
      authorId: 2,
      procedures: ["first s44444444tep", "second step", "third step", "fourth step",],
      ingredients: [
        Ingredient(
            name: "tomato",
            image: "https://placehold.co/100x100.jpg",
            amount: 100
        ),
        Ingredient(
            name: "potato",
            image: "https://placehold.co/100x100.jpg",
            amount: 200
        ),
        Ingredient(
            name: "meat",
            image: "https://placehold.co/100x100.jpg",
            amount: 300
        ),

      ],
      reviewCount: 444,
    ),


  ];

  @override
  Future<DetailedRecipeFragment> getRecipeDetailFragmentById(int id) async {
    return _recipeFragments[id];
  }


}
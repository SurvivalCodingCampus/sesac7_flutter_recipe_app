import 'package:flutter_recipe_app/core/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipes_repository.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/network_error.dart';

// MVVM 테스트용 MockRepository: 실제 구현체와 동일 인터페이스!
class MockRecipeRepository implements RecipeRepository {
  final List<Recipe> _recipes = [
    Recipe(
      category: "Indian",
      id: 1,
      name: "Traditional spare ribs baked",
      image: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
      chef: "Chef John",
      time: "20 min",
      rating: 4.0,
      isBookmarked: true,
      ingredients: [
        Ingredient(name: "Tomatos", image: "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg", amount: "500g"),
        Ingredient(name: "Beef", image: "https://cdn.pixabay.com/photo/2016/01/21/18/08/meet-1154341_1280.png", amount: "300g"),
        Ingredient(name: "Onion", image: "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg", amount: "100g"),
      ],
      steps: [
        "Preheat the oven to 350°F (175°C).",
        "Remove the membrane from the back of the ribs if it is still attached.",
        "Season the ribs with salt, pepper, and your favorite rub.",
        "Wrap the ribs in aluminum foil to retain moisture.",
        "Bake in the oven for 2 hours.",
        "Remove from the oven and unwrap.",
        "Brush with barbecue sauce.",
        "Bake uncovered for 30 minutes."
      ],
    ),
    Recipe(
      category: "Asian",
      id: 2,
      name: "Spice roasted chicken with flavored rice",
      image: "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      chef: "Mark Kelvin",
      time: "20 min",
      rating: 4.0,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Chicken", image: "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg", amount: "500g"),
        Ingredient(name: "Rice", image: "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg", amount: "300g"),
        Ingredient(name: "Pepper", image: "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg", amount: "10g"),
      ],
      steps: [
        "Marinate the chicken with spices and let it sit for 30 minutes.",
        "Preheat the oven to 375°F (190°C) and roast the chicken for 45 minutes.",
        "Cook the rice with chicken broth.",
        "Add vegetables and pepper for flavor."
      ],
    ),
    Recipe(
      category: "Chinese",
      id: 3,
      name: "Spicy fried rice mix chicken bali",
      image: "https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg",
      chef: "Spicy Nelly",
      time: "20 min",
      rating: 4.0,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Chicken", image: "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg", amount: "300g"),
        Ingredient(name: "Rice", image: "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg", amount: "200g"),
        Ingredient(name: "Onion", image: "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg", amount: "50g"),
      ],
      steps: [
        "Cook the rice and let it cool.",
        "Stir-fry chicken with spices.",
        "Add onions and vegetables.",
        "Mix chicken and rice together and fry."
      ],
    ),
    Recipe(
      category: "Japanese",
      id: 4,
      name: "Ttekbokki",
      image: "https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_1280.jpg",
      chef: "Kim Dahee",
      time: "30 min",
      rating: 5.0,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Rice cake", image: "https://cdn.pixabay.com/photo/2021/01/22/15/35/rice-cake-5941272_1280.jpg", amount: "400g"),
        Ingredient(name: "Fish cake", image: "https://cdn.pixabay.com/photo/2020/03/09/05/37/fish-cake-4913227_1280.jpg", amount: "100g"),
        Ingredient(name: "Onion", image: "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg", amount: "50g"),
      ],
      steps: [
        "Soak rice cakes in water for 20 minutes.",
        "Boil water and add gochujang.",
        "Add rice cakes and fish cakes, cook until thickened."
      ],
    ),
    Recipe(
      category: "American",
      id: 5,
      name: "Grilled salmon with avocado salsa",
      image: "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg",
      chef: "Alice Johnson",
      time: "25 min",
      rating: 4.5,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Salmon", image: "https://cdn.pixabay.com/photo/2016/03/05/19/02/salmon-1238248_1280.jpg", amount: "400g"),
        Ingredient(name: "Avocado", image: "https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg", amount: "100g"),
      ],
      steps: [
        "Season salmon and grill for 10 minutes.",
        "Mix avocado, lime, and onion for salsa.",
        "Serve grilled salmon topped with salsa."
      ],
    ),
    Recipe(
      category: "British",
      id: 6,
      name: "Beef Wellington",
      image: "https://cdn.pixabay.com/photo/2019/10/22/10/11/beef-wellington-4568239_1280.jpg",
      chef: "Gordon Ramsay",
      time: "45 min",
      rating: 5.0,
      isBookmarked: true,
      ingredients: [
        Ingredient(name: "Beef", image: "https://cdn.pixabay.com/photo/2016/01/21/18/08/meet-1154341_1280.png", amount: "500g"),
        Ingredient(name: "Mushroom", image: "https://cdn.pixabay.com/photo/2015/07/02/10/22/mushrooms-828939_1280.jpg", amount: "150g"),
        Ingredient(name: "Puff pastry", image: "https://cdn.pixabay.com/photo/2017/01/31/19/18/puff-pastry-2024648_1280.jpg", amount: "200g"),
      ],
      steps: [
        "Sear beef fillet, cool.",
        "Spread mushroom duxelles over beef.",
        "Wrap beef in puff pastry.",
        "Bake at 200°C for 35 minutes."
      ],
    ),
    Recipe(
      category: "Italian",
      id: 7,
      name: "Classic Margherita Pizza",
      image: "https://cdn.pixabay.com/photo/2019/05/15/18/56/pizza-4205701_1280.jpg",
      chef: "Mario Batali",
      time: "15 min",
      rating: 4.3,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Pizza dough", image: "https://cdn.pixabay.com/photo/2017/06/02/18/24/pizza-2363571_1280.jpg", amount: "1ea"),
        Ingredient(name: "Tomato sauce", image: "https://cdn.pixabay.com/photo/2015/03/24/23/53/tomato-687591_1280.jpg", amount: "100g"),
        Ingredient(name: "Mozzarella", image: "https://cdn.pixabay.com/photo/2018/04/30/13/49/mozzarella-3362512_1280.jpg", amount: "100g"),
      ],
      steps: [
        "Spread tomato sauce over dough.",
        "Add mozzarella and basil.",
        "Bake at 220°C for 10 minutes."
      ],
    ),
    Recipe(
      category: "Japanese",
      id: 8,
      name: "Sushi Platter",
      image: "https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg",
      chef: "Jiro Ono",
      time: "60 min",
      rating: 4.8,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Rice", image: "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg", amount: "200g"),
        Ingredient(name: "Salmon", image: "https://cdn.pixabay.com/photo/2016/03/05/19/02/salmon-1238248_1280.jpg", amount: "100g"),
        Ingredient(name: "Seaweed", image: "https://cdn.pixabay.com/photo/2017/06/02/18/24/seaweed-2363570_1280.jpg", amount: "5 sheets"),
      ],
      steps: [
        "Cook rice and season with vinegar.",
        "Prepare fish and toppings.",
        "Roll sushi with seaweed and fillings."
      ],
    ),
    Recipe(
      category: "French",
      id: 9,
      name: "French Onion Soup",
      image: "https://cdn.pixabay.com/photo/2016/03/03/16/19/food-1234483_1280.jpg",
      chef: "Julia Child",
      time: "40 min",
      rating: 4.6,
      isBookmarked: true,
      ingredients: [
        Ingredient(name: "Onion", image: "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg", amount: "400g"),
        Ingredient(name: "Beef stock", image: "https://cdn.pixabay.com/photo/2017/07/16/10/44/soup-2500162_1280.jpg", amount: "500ml"),
        Ingredient(name: "Cheese", image: "https://cdn.pixabay.com/photo/2014/12/21/23/28/cheese-579612_1280.png", amount: "100g"),
      ],
      steps: [
        "Slice onions thinly and caramelize.",
        "Add beef stock and simmer.",
        "Top with cheese and broil."
      ],
    ),
    Recipe(
      category: "French",
      id: 10,
      name: "Chocolate Lava Cake",
      image: "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_1280.jpg",
      chef: "Paul Hollywood",
      time: "30 min",
      rating: 4.9,
      isBookmarked: false,
      ingredients: [
        Ingredient(name: "Chocolate", image: "https://cdn.pixabay.com/photo/2017/01/20/15/06/chocolate-1992262_1280.jpg", amount: "200g"),
        Ingredient(name: "Butter", image: "https://cdn.pixabay.com/photo/2014/12/21/23/41/butter-579622_1280.png", amount: "100g"),
        Ingredient(name: "Eggs", image: "https://cdn.pixabay.com/photo/2016/03/05/19/02/eggs-1238249_1280.jpg", amount: "2ea"),
      ],
      steps: [
        "Melt chocolate and butter together.",
        "Whisk eggs and sugar.",
        "Combine with chocolate mixture.",
        "Bake until outside is set but inside is molten."
      ],
    ),
  ];

  @override
  Future<Result<List<Recipe>, NetworkError>> fetchRecipes() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.success(_recipes);
  }

  @override
  Future<Result<Recipe, NetworkError>> fetchRecipeById(int id) async {
    try {
      final recipe = _recipes.firstWhere((r) => r.id == id);
      return Result.success(recipe);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }
  }
}
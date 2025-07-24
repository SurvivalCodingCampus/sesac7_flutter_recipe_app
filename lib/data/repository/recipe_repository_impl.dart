import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      Recipe(
        id: '1',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop',
        recipeName: 'Spicy chicken burger with French fries',
        rating: 4.0,
        cookingTime: '20 min',
        ingredients: [
          Ingredient(
            name: 'Tomatos',
            amount: '500g',
            imageUrl:
                'https://images.unsplash.com/photo-1561155653-29221e29b144?q=80&w=2070&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Cabbage',
            amount: '300g',
            imageUrl:
                'https://images.unsplash.com/photo-1561587318-b2a5a0438a45?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Taco',
            amount: '300g',
            imageUrl:
                'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Slice Bread',
            amount: '300g',
            imageUrl:
                'https://images.unsplash.com/photo-1534293258471-896a2415a146?q=80&w=1974&auto=format&fit=crop',
          ),
        ],
        procedures: [
          'Lorem ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
          'Lorem ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
          'Lorem ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
        ],
      ),
      Recipe(
        id: '2',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1615937691194-97dbd3f3dc29?q=80&w=1964&auto=format&fit=crop',
        recipeName: 'Traditional spare ribs baked',
        rating: 4.5,
        cookingTime: '30 min',
        ingredients: List.generate(
          6,
          (i) => Ingredient(
            name: 'Chicken Part ${i + 1}',
            amount: '${(i + 1) * 100}g',
            imageUrl:
                'https://images.unsplash.com/photo-1606728035253-49e8a23146de?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          5,
          (i) =>
              'Procedure step ${i + 1}: Detailed instructions for roasting the chicken perfectly.',
        ),
      ),
      Recipe(
        id: '3',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1540189549336-e6e-99c3679fe?q=80&w=1974&auto=format&fit=crop',
        recipeName: 'Fresh Summer Salad',
        rating: 4.8,
        cookingTime: '15 min',
        ingredients: List.generate(
          10,
          (i) => Ingredient(
            name: 'Veggie ${i + 1}',
            amount: '1 piece',
            imageUrl:
                'https://images.unsplash.com/photo-1540914124281-3425879423d9?q=80&w=1964&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          5,
          (i) =>
              'Salad Step ${i + 1}: How to assemble the best summer salad ever.',
        ),
      ),
      Recipe(
        id: '4',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1482049016688-2d3e-1b311543?q=80&w=1910&auto=format&fit=crop',
        recipeName: 'Avocado Toast with Egg',
        rating: null,
        cookingTime: '10 min',
        ingredients: [
          Ingredient(
            name: 'Bread Slice',
            amount: '2',
            imageUrl:
                'https://images.unsplash.com/photo-1534293258471-896a2415a146?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Avocado',
            amount: '1',
            imageUrl:
                'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?q=80&w=1975&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Egg',
            amount: '2',
            imageUrl:
                'https://images.unsplash.com/photo-1587486913049-53fc889c079d?q=80&w=2070&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          7,
          (i) =>
              'Avocado Toast step ${i + 1}: A simple step for a quick breakfast.',
        ),
      ),
      Recipe(
        id: '5',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1529042410759-befb1204b468?q=80&w=1972&auto=format&fit=crop',
        recipeName: 'Classic Spaghetti Carbonara',
        rating: 4.9,
        cookingTime: '25 min',
        ingredients: [
          Ingredient(
            name: 'Spaghetti',
            amount: '400g',
            imageUrl:
                'https://images.unsplash.com/photo-1551183053-bf91a1d8c402?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Pancetta',
            amount: '150g',
            imageUrl:
                'https://images.unsplash.com/photo-1591989330748-7865a1533833?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Eggs',
            amount: '3',
            imageUrl:
                'https://images.unsplash.com/photo-1587486913049-53fc889c079d?q=80&w=2070&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Parmesan',
            amount: '100g',
            imageUrl:
                'https://images.unsplash.com/photo-1618164436245-2d3d41868dec?q=80&w=1974&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          8,
          (i) =>
              'Carbonara Step ${i + 1}: The secret to authentic Italian carbonara.',
        ),
      ),
      Recipe(
        id: '6',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=1980&auto=format&fit=crop',
        recipeName: 'Fluffy Pancakes',
        rating: 4.6,
        cookingTime: '20 min',
        ingredients: [
          Ingredient(
            name: 'Flour',
            amount: '2 cups',
            imageUrl:
                'https://images.unsplash.com/photo-1509836336281-53a1ac1aago3?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Milk',
            amount: '1.5 cups',
            imageUrl:
                'https://images.unsplash.com/photo-1550583724-b2692b85b150?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Egg',
            amount: '1',
            imageUrl:
                'https://images.unsplash.com/photo-1587486913049-53fc889c079d?q=80&w=2070&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          6,
          (i) =>
              'Pancake Step ${i + 1}: Get the fluffiest pancakes every time with this tip.',
        ),
      ),
      Recipe(
        id: '7',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Tomato Basil Soup',
        rating: 4.3,
        cookingTime: '35 min',
        ingredients: [
          Ingredient(
            name: 'Tomatoes',
            amount: '1kg',
            imageUrl:
                'https://images.unsplash.com/photo-1561155653-29221e29b144?q=80&w=2070&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Basil',
            amount: '1 bunch',
            imageUrl:
                'https://images.unsplash.com/photo-1629228736395-13d85584f738?q=80&w=1964&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Vegetable Broth',
            amount: '500ml',
            imageUrl:
                'https://images.unsplash.com/photo-1541696432-82c6da8ce7bf?q=80&w=2070&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          9,
          (i) =>
              'Soup Step ${i + 1}: A guide to a creamy and delicious tomato soup.',
        ),
      ),
      Recipe(
        id: '8',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?q=80&w=1950&auto=format&fit=crop',
        recipeName: 'Chocolate Lava Cake',
        rating: 4.9,
        cookingTime: '30 min',
        ingredients: [
          Ingredient(
            name: 'Dark Chocolate',
            amount: '200g',
            imageUrl:
                'https://images.unsplash.com/photo-1571115177422-23e00ed14561?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Butter',
            amount: '100g',
            imageUrl:
                'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?q=80&w=2070&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Eggs',
            amount: '4',
            imageUrl:
                'https://images.unsplash.com/photo-1587486913049-53fc889c079d?q=80&w=2070&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Sugar',
            amount: '50g',
            imageUrl:
                'https://images.unsplash.com/photo-1596043435137-e0242d514638?q=80&w=1974&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          10,
          (i) => 'Lava Cake Step ${i + 1}: Achieve the perfect molten center.',
        ),
      ),
      Recipe(
        id: '9',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Margherita Pizza',
        rating: 4.7,
        cookingTime: '20 min',
        ingredients: [
          Ingredient(
            name: 'Pizza Dough',
            amount: '1 ball',
            imageUrl:
                'https://images.unsplash.com/photo-1593474751353-03b1a45c3a37?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Tomato Sauce',
            amount: '1 cup',
            imageUrl:
                'https://images.unsplash.com/photo-1598815114942-121d201e1333?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Mozzarella',
            amount: '200g',
            imageUrl:
                'https://images.unsplash.com/photo-1628636614217-c9854c38a34a?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Basil',
            amount: 'a few leaves',
            imageUrl:
                'https://images.unsplash.com/photo-1629228736395-13d85584f738?q=80&w=1964&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          7,
          (i) => 'Pizza Step ${i + 1}: From dough to oven, the complete guide.',
        ),
      ),
      Recipe(
        id: '10',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop',
        recipeName: 'Grilled Lemon Herb Chicken',
        rating: null,
        cookingTime: '40 min',
        ingredients: [
          Ingredient(
            name: 'Chicken Breasts',
            amount: '4',
            imageUrl:
                'https://images.unsplash.com/photo-1606728035253-49e8a23146de?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Lemon',
            amount: '1',
            imageUrl:
                'https://images.unsplash.com/photo-1574316234321-3c4a384115e3?q=80&w=1974&auto=format&fit=crop',
          ),
          Ingredient(
            name: 'Herbs (Thyme, Rosemary)',
            amount: '2 tbsp',
            imageUrl:
                'https://images.unsplash.com/photo-1598030304671-5aa1d6f21128?q=80&w=1974&auto=format&fit=crop',
          ),
        ],
        procedures: List.generate(
          8,
          (i) =>
              'Grilling Step ${i + 1}: Tips for a juicy and flavorful grilled chicken.',
        ),
      ),
      Recipe(
        id: '11',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=2080&auto=format&fit=crop',
        recipeName: 'Healthy Quinoa Bowl',
        rating: 4.8,
        cookingTime: '25 min',
        ingredients: List.generate(
          15,
          (i) => Ingredient(
            name: 'Bowl Item ${i + 1}',
            amount: '1/2 cup',
            imageUrl:
                'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?q=80&w=1964&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          5,
          (i) =>
              'Quinoa Bowl Step ${i + 1}: A guide to a healthy and tasty meal.',
        ),
      ),
      Recipe(
        id: '12',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=1974&auto=format&fit=crop',
        recipeName: 'Pan-Seared Salmon',
        rating: 4.9,
        cookingTime: '15 min',
        ingredients: List.generate(
          7,
          (i) => Ingredient(
            name: 'Salmon Ingredient ${i + 1}',
            amount: '1 fillet',
            imageUrl:
                'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?q=80&w=2070&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          6,
          (i) => 'Salmon Step ${i + 1}: How to get that perfect crispy skin.',
        ),
      ),
      Recipe(
        id: '13',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1484723050470-6b1d3b2a3a2b?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Beef Tacos',
        rating: 4.5,
        cookingTime: '20 min',
        ingredients: List.generate(
          10,
          (i) => Ingredient(
            name: 'Taco Filling ${i + 1}',
            amount: 'some',
            imageUrl:
                'https://images.unsplash.com/photo-1565299712540-6bb353a5567a?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          8,
          (i) => 'Taco Step ${i + 1}: Building the ultimate beef taco.',
        ),
      ),
      Recipe(
        id: '14',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Vegetable Stir-fry',
        rating: 4.2,
        cookingTime: '15 min',
        ingredients: List.generate(
          18,
          (i) => Ingredient(
            name: 'Stir-fry Veggie ${i + 1}',
            amount: '1 cup',
            imageUrl:
                'https://images.unsplash.com/photo-1606843048355-7a2874a9c1f2?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          7,
          (i) => 'Stir-fry Step ${i + 1}: Quick and easy weeknight dinner.',
        ),
      ),
      Recipe(
        id: '15',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Shrimp Scampi',
        rating: 4.7,
        cookingTime: '20 min',
        ingredients: List.generate(
          8,
          (i) => Ingredient(
            name: 'Scampi Item ${i + 1}',
            amount: 'some',
            imageUrl:
                'https://images.unsplash.com/photo-1625944012231-f03939b49319?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          6,
          (i) =>
              'Shrimp Scampi Step ${i + 1}: A classic Italian-American dish.',
        ),
      ),
      Recipe(
        id: '16',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1481931098730-318b6f776db0?q=80&w=1994&auto=format&fit=crop',
        recipeName: 'Blueberry Muffins',
        rating: 4.6,
        cookingTime: '30 min',
        ingredients: List.generate(
          9,
          (i) => Ingredient(
            name: 'Muffin Mix ${i + 1}',
            amount: '1/4 cup',
            imageUrl:
                'https://images.unsplash.com/photo-1599785209707-a456fc1337bb?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          7,
          (i) => 'Muffin Step ${i + 1}: Baking the perfect blueberry muffins.',
        ),
      ),
      Recipe(
        id: '17',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Homemade Pepperoni Pizza',
        rating: 4.8,
        cookingTime: '25 min',
        ingredients: List.generate(
          7,
          (i) => Ingredient(
            name: 'Pizza Item ${i + 1}',
            amount: 'some',
            imageUrl:
                'https://images.unsplash.com/photo-1594007654729-407eedc4be65?q=80&w=1974&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          8,
          (i) => 'Pizza Step ${i + 1}: Making delicious pizza from scratch.',
        ),
      ),
      Recipe(
        id: '18',
        userId: 'user3',
        imageUrl:
            'https://images.unsplash.com/photo-1432139555190-58524dae6a55?q=80&w=1972&auto=format&fit=crop',
        recipeName: 'BBQ Pulled Pork',
        rating: 4.9,
        cookingTime: '4 hours',
        ingredients: List.generate(
          10,
          (i) => Ingredient(
            name: 'Pork Ingredient ${i + 1}',
            amount: '1 cup',
            imageUrl:
                'https://images.unsplash.com/photo-1599043513036-62dd5312f275?q=80&w=2070&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          5,
          (i) => 'Pulled Pork Step ${i + 1}: Slow-cooked to perfection.',
        ),
      ),
      Recipe(
        id: '19',
        userId: 'user1',
        imageUrl:
            'https://images.unsplash.com/photo-1512152272829-e3139592d56f?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Cheeseburger',
        rating: 4.4,
        cookingTime: '15 min',
        ingredients: List.generate(
          8,
          (i) => Ingredient(
            name: 'Burger Item ${i + 1}',
            amount: '1',
            imageUrl:
                'https://images.unsplash.com/photo-1571091718767-18b5b1457add?q=80&w=2072&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          6,
          (i) =>
              'Cheeseburger Step ${i + 1}: Grilling the perfect cheeseburger.',
        ),
      ),
      Recipe(
        id: '20',
        userId: 'user2',
        imageUrl:
            'https://images.unsplash.com/photo-1598515214211-89d3c7373058?q=80&w=1974&auto=format&fit=crop',
        recipeName: 'Chicken Caesar Salad',
        rating: 4.3,
        cookingTime: '20 min',
        ingredients: List.generate(
          9,
          (i) => Ingredient(
            name: 'Salad Item ${i + 1}',
            amount: 'some',
            imageUrl:
                'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?q=80&w=2070&auto=format&fit=crop',
          ),
        ),
        procedures: List.generate(
          5,
          (i) => 'Caesar Salad Step ${i + 1}: Creating a classic Caesar salad.',
        ),
      ),
    ];
  }
}

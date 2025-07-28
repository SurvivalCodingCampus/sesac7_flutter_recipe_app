import 'package:flutter_recipe_app/data/procedure/data_source/procedure_data_source.dart';
import 'package:flutter_recipe_app/data/procedure/dto/procedure_dto.dart';

class MockProcedureDataSourceImpl implements ProcedureDataSource {
  final data = [
    {
      "id": 1,
      "steps": [
        "Preheat oven to 180°C (350°F).",
        "Season pork spare ribs generously with salt, pepper, and desired spices.",
        "Place ribs in a roasting pan with sliced onions and tomatoes.",
        "Bake for 90 minutes, or until ribs are tender and fully cooked.",
        "Rest for a few minutes before serving.",
      ],
    },
    {
      "id": 2,
      "steps": [
        "Marinate chicken pieces in a mixture of yogurt and aromatic spices for at least 30 minutes.",
        "Preheat oven to 200°C (400°F).",
        "Roast the marinated chicken until golden brown and cooked through.",
        "Prepare the flavored rice by cooking with whole spices like cardamom, cloves, and bay leaf.",
        "Serve the spice-roasted chicken alongside the fragrant rice.",
      ],
    },
    {
      "id": 3,
      "steps": [
        "Heat a wok or large frying pan over high heat with oil.",
        "Add diced chicken and stir-fry until cooked and lightly browned.",
        "Add chopped onion, garlic, and chilies; stir-fry until fragrant.",
        "Add cooked rice and break up any clumps, mixing well.",
        "Pour in soy sauce, chili sauce, and a dash of sesame oil; stir-fry until all ingredients are well combined and hot.",
        "Garnish with fresh cilantro and serve immediately.",
      ],
    },
    {
      "id": 4,
      "steps": [
        "Soak rice cakes (tteok) in warm water for 10-15 minutes to soften.",
        "In a pot, combine gochujang (Korean chili paste), gochugaru (Korean chili powder), soy sauce, sugar, and anchovy broth.",
        "Bring the sauce to a boil, then add the softened rice cakes and fish cakes.",
        "Add any desired vegetables like cabbage or onions, and simmer until the sauce thickens and the rice cakes are chewy.",
        "Add hard-boiled eggs and green onions in the last few minutes of cooking.",
        "Serve hot, often garnished with sesame seeds.",
      ],
    },
    {
      "id": 5,
      "steps": [
        "Season salmon fillets with salt, pepper, and a squeeze of lemon juice.",
        "Preheat grill to medium-high heat.",
        "Grill salmon for 4-6 minutes per side, depending on thickness, until it flakes easily with a fork.",
        "For avocado salsa, dice avocado, red onion, and fresh cilantro. Mix with lime juice and a pinch of salt.",
        "Serve the grilled salmon topped generously with the fresh avocado salsa.",
      ],
    },
    {
      "id": 6,
      "steps": [
        "Sear beef tenderloin on all sides until browned.",
        "Coat the beef with a mushroom duxelles (finely chopped mushrooms, shallots, herbs sautéed until dry).",
        "Wrap the beef in prosciutto, then in puff pastry.",
        "Brush with egg wash and bake in a preheated oven until the pastry is golden brown and the beef reaches desired doneness.",
        "Rest before slicing and serving.",
      ],
    },
    {
      "id": 7,
      "steps": [
        "Prepare pizza dough and stretch it to your desired size.",
        "Spread a thin layer of San Marzano tomato sauce evenly over the dough.",
        "Scatter fresh mozzarella cheese over the sauce.",
        "Add fresh basil leaves.",
        "Bake in a very hot oven (preferably a pizza oven) until the crust is golden and crispy, and the cheese is bubbly.",
        "Drizzle with a little olive oil before serving.",
      ],
    },
    {
      "id": 8,
      "steps": [
        "Prepare sushi rice: cook rice, then season with rice vinegar, sugar, and salt.",
        "Prepare various fillings: slice fresh fish (sashimi grade), cut vegetables into thin strips.",
        "For nigiri, mold small portions of rice and top with a slice of fish.",
        "For rolls (maki), lay nori (seaweed) on a bamboo mat, spread rice, add fillings, and roll tightly.",
        "Slice rolls into bite-sized pieces.",
        "Arrange on a platter and serve with soy sauce, wasabi, and pickled ginger.",
      ],
    },
    {
      "id": 9,
      "steps": [
        "Thinly slice onions and caramelize them slowly in butter until deep golden brown.",
        "Deglaze the pan with dry white wine or sherry.",
        "Add beef broth and simmer for at least 30 minutes.",
        "Season with salt and pepper to taste.",
        "Ladle soup into oven-safe bowls, top with toasted bread, and cover with Gruyère cheese.",
        "Broil until the cheese is melted and bubbly.",
      ],
    },
    {
      "id": 10,
      "steps": [
        "Preheat oven to 200°C (400°F) and grease ramekins.",
        "Melt butter and chocolate together over a double boiler or in the microwave.",
        "In a separate bowl, whisk eggs, egg yolks, and sugar until light and fluffy.",
        "Fold the melted chocolate mixture into the egg mixture.",
        "Sift in flour and mix until just combined.",
        "Pour batter into prepared ramekins and bake for 12-15 minutes, until edges are set but the center is still gooey.",
        "Invert onto plates, and serve immediately with a dusting of powdered sugar or a scoop of ice cream.",
      ],
    },
  ];

  @override
  Future<List<ProcedureDto>> getAllProcedures() async {
    return data.map((e) => ProcedureDto.fromJson(e)).toList();
  }
}

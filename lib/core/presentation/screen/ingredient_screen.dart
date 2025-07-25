import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/recipe_ingredients/domain/repository/ingredient_repository.dart';

import 'package:flutter_recipe_app/core/presentation/component/ingredient/ingredient_item.dart';
import '../../domain/model/ingredient.dart';


class IngredientScreen extends StatefulWidget {

  const IngredientScreen({super.key});
  // 클래스를 만들때 사용되는 생성자
  // 변경감지를 쉽게하기 위한 식별자 key를 부모클래스인 StatefulWidget에 전달

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {

  List<Ingredient> ingredients = [];

  @override
  void initState() {
    super.initState();
    fetchIngredients();
  }

  void fetchIngredients() async {
    // final fetched = await IngredientRepository.fetchIngredients();
    // setState(() {
    //   ingredients = fetched;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ingredients list'),
      ),
      body: Column(
        children: ingredients.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IngredientItem(ingredient: item),
          );
        }).toList(),
      ),
    );
  }

}
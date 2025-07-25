import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/category_button.dart';

class RecipeCategorySelector extends StatelessWidget {
  final Set<String> categories;
  final String selectedCategory;
  final Function(String selectedCategory) onValueChange;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 31.0,
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return CategoryButton(
                title: 'All',
                isSelected: selectedCategory == 'All',
                onTap: () {
                  if (selectedCategory != 'All') {
                    onValueChange('All');
                  }
                },
              );
            }
            return CategoryButton(
              title: categories.elementAt(index - 1),
              isSelected: categories.elementAt(index - 1) == selectedCategory,
              onTap: () {
                if (categories.elementAt(index - 1) != selectedCategory) {
                  onValueChange(categories.elementAt(index - 1));
                }
              },
            );
          },
          itemCount: categories.length + 1, // 'All' 카테고리 때문에 + 1 처리
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 30, top: 0),
        ),
      ),
    );
  }
}

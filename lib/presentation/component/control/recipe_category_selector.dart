import 'package:flutter/material.dart';

class RecipeCategorySelector extends StatelessWidget { // StatefulWidget 대신 StatelessWidget 사용
  final List<String> categories; // 모든 카테고리 목록
  final String selectedCategory; // 현재 선택된 카테고리 (부모로부터 받음)
  final ValueChanged<String> onSelectCategory; // 카테고리 선택 시 콜백 (부모로 전달)

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: categories.length, // widget.categories 대신 categories 사용
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory; // widget.selectedCategory 대신 selectedCategory 사용

          return GestureDetector(
            onTap: () {
              onSelectCategory(category); // 콜백 호출
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[700] : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.green[700]! : Colors.transparent,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

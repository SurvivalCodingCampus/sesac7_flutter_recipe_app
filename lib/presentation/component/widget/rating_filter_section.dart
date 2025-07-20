import 'package:flutter/material.dart'; // Cupertino 대신 Material 사용
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';

class RatingFilterSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> filterItemList;

  const RatingFilterSection({
    super.key,
    required this.title,
    required this.filterItemList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: filterItemList.map((item) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: RatingButton(rating: item['name'] as String,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
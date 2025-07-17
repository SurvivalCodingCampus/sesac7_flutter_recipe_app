import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(bool selected) toggleSelected;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.toggleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? GestureDetector(
            onTap: () {
              toggleSelected(isSelected);
            },
            child: Container(
              // width: 43,
              height: 27,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                text,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              toggleSelected(isSelected);
            },
            child: Container(
              // width: 43,
              height: 27,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary80, width: 1)
              ),
              child: Text(
                text,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.primary80,
                ),
              ),
            ),
          );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: FilterButton(
              text: 'Local Dish',
              isSelected: true,
              toggleSelected: (selected) {
                print(selected);
              },
            ),
          ),
        ),
      ),
    ),
  );
}

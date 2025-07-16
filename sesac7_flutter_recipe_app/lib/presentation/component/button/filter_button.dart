import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String filterTitle;
  final bool isSelected;
  final Function(bool isSelected) onValueChange;

  const FilterButton({
    super.key,
    required this.filterTitle,
    required this.isSelected,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onValueChange(!isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? AppColors.primary100 : AppColors.primary80,
              width: 1.0,
            ),
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? AppColors.primary100 : AppColors.white,
        ),
        child: Text(
          filterTitle,
          style: isSelected
              ? TextStyles.selectedFilterTitle
              : TextStyles.unSelectedFilterTitle,
        ),
      ),
    );
  }
}

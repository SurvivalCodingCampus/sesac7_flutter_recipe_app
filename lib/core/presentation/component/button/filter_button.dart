import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(bool oldValue) onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(isSelected),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 27,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary100 : AppColors.white,
              border: Border.all(
                color: isSelected ? AppColors.primary100 : AppColors.primary80,
              ),
              borderRadius: BorderRadius.circular(
                ComponentConstant.borderRadius,
              ),
            ),
            child: Text(
              text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

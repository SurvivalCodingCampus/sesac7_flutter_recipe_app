import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SearchFilterButton extends StatelessWidget {
  static const double size = 40;

  final VoidCallback onTap;

  const SearchFilterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Icon(
          Icons.format_line_spacing_outlined,
          color: AppColors.white,
          size: ComponentConstant.iconSize,
        ),
      ),
    );
  }
}

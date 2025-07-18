import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SearchFilterButton extends StatelessWidget {
  static const double size = 40;

  const SearchFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

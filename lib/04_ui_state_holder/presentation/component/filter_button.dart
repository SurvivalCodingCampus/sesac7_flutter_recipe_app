import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';

class FilterButton extends StatelessWidget {
  final void Function() onClick;

  const FilterButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary80,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          Icons.tune,
          size: 20,
          color: AppColors.white,
        ),
      ),
    );
  }
}

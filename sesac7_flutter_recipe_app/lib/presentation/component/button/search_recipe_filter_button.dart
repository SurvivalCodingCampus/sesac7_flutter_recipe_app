import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SearchRecipeFilterButton extends StatelessWidget {
  final VoidCallback onClick;
  const SearchRecipeFilterButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.primary100,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.tune_rounded,
          color: AppColors.white,
          size: 20.0,
        ),
      ),
    );
  }
}

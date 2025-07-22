import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class MainBottomNavItem extends StatelessWidget {
  final IconData iconData;
  final int index;
  final String label;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MainBottomNavItem({
    super.key,
    required this.iconData,
    required this.index,
    required this.label,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemTapped(index);
      },
      child: Icon(
        iconData,
        color: selectedIndex == index
            ? AppColors.primary100
            : AppColors.gray4,
        size: 24.0,
      ),
    );
  }
}

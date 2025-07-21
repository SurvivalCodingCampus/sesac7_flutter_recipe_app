import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class MainNavigationScreen extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final void Function(int index) onTabSelected;

  const MainNavigationScreen({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavigationTab(
                    icon: Icons.home_outlined,
                    isSelected: currentIndex == 0,
                    onTap: () => onTabSelected(0),
                  ),
                  _NavigationTab(
                    icon: Icons.bookmark_border,
                    isSelected: currentIndex == 1,
                    onTap: () => onTabSelected(1),
                  ),
                  _NavigationTab(
                    icon: Icons.notifications_none_rounded,
                    isSelected: currentIndex == 2,
                    onTap: () => onTabSelected(2),
                  ),
                  _NavigationTab(
                    icon: Icons.person_outline,
                    isSelected: currentIndex == 3,
                    onTap: () => onTabSelected(3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationTab extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationTab({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: isSelected ? AppColors.primary100 : AppColors.gray4,
        size: 24,
      ),
    );
  }
}

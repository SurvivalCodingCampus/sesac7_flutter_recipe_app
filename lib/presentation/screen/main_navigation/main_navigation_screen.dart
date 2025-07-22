import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class MainNavigationScreen extends StatelessWidget {
  static const int shadowColorValue = 0xff6c6c6c;
  static const Key homeTabKey = Key('MainNavigationScreen home tab');
  static const Key savedRecipesTabKey = Key(
    'MainNavigationScreen saved recipes tab',
  );
  static const Key notificationsTabKey = Key(
    'MainNavigationScreen notifications tab',
  );
  static const Key profileTabKey = Key('MainNavigationScreen profile tab');

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
      body: Column(
        children: [
          Expanded(child: child),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(40, 24, 40, 54),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                        shadowColorValue,
                      ).withAlpha(ComponentConstant.mainNavigationShadowAlpha),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  spacing: 40,
                  children: [
                    _NavigationTab(
                      key: homeTabKey,
                      icon: Icons.home_outlined,
                      isSelected: currentIndex == 0,
                      onTap: () => onTabSelected(0),
                    ),
                    _NavigationTab(
                      key: savedRecipesTabKey,
                      icon: Icons.bookmark_border,
                      isSelected: currentIndex == 1,
                      onTap: () => onTabSelected(1),
                    ),
                    const Spacer(),
                    _NavigationTab(
                      key: notificationsTabKey,
                      icon: Icons.notifications_none_rounded,
                      isSelected: currentIndex == 2,
                      onTap: () => onTabSelected(2),
                    ),
                    _NavigationTab(
                      key: profileTabKey,
                      icon: Icons.person_outline,
                      isSelected: currentIndex == 3,
                      onTap: () => onTabSelected(3),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 72,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavigationTab extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationTab({
    super.key,
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

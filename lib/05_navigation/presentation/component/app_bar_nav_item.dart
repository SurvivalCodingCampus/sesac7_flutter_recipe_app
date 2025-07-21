import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:go_router/go_router.dart';

class AppBarNavItem extends StatelessWidget {
  final BuildContext context; // go 사용하기 위해
  final StatefulNavigationShell navigationShell; // index 따오기 위해
  final int index; // 각 버튼의 인덱스 저장
  final IconData icon; // 설정할 아이콘
  final String label; // 설정할 라벨

  const AppBarNavItem({
    super.key,
    required this.context,
    required this.navigationShell,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: IconButton(
        highlightColor: Colors.transparent,
        icon: Icon(
          icon,
          color: (navigationShell.currentIndex == index)
              ? AppColors.primary100
              : AppColors.gray4,
          size: 24,
        ),
        onPressed: () => navigationShell.goBranch(
          index,
          initialLocation: (navigationShell.currentIndex == index),
        ),
      ),
    );
  }
}

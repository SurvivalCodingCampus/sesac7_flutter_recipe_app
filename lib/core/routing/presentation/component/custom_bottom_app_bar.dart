import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/app_colors.dart';
import 'app_bar_nav_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell; // index 따오기 위해

  const CustomBottomAppBar({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: const CircularNotchedRectangle(), // 노치 모양 생성
        notchMargin: 8.0, // 노치와 floatingActionButton 사이의 간격
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 0,
              icon: Icons.home,
              label: 'Home',
            ),
            // Bookmark
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 1,
              icon: Icons.bookmark_border,
              label: 'Bookmark',
            ),
            const SizedBox(width: 48),
            // Notification
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 2,
              icon: Icons.notifications,
              label: 'Notification',
            ),
            // MyPage
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 3,
              icon: Icons.person,
              label: 'MyPage',
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 48,
        height: 48,
        child: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          backgroundColor: AppColors.primary100,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 21,
          ),
        ),
      ),
      // floatingActionButton 위치 설정
      // centerDocked는 네비게이션 가운데에 꽂힌 형태가 됨
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

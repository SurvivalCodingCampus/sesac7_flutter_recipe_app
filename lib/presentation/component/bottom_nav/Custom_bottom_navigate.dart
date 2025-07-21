import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  // 현재 인덱스에 따라 아이콘 강조 여부 판단
  int get currentIndex => navigationShell.currentIndex;

  void _onTap(int index) {
    if (index == currentIndex) return;
    navigationShell.goBranch(
      index,
      initialLocation: true, // 스택 초기화 여부
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      resizeToAvoidBottomInset: false, // FAB이 키보드에 영향받지 않음
      // 중앙 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB 클릭됨');
        },
        backgroundColor: AppColors.primary100,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: AppColors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        elevation: 10, // ✨ 그림자 추가
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 왼쪽
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: currentIndex == 0 ? AppColors.primary100 : AppColors.gray4,
                    ),
                    onPressed: () => _onTap(0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: currentIndex == 1 ? AppColors.primary100 : AppColors.gray4,
                    ),
                    onPressed: () => _onTap(1),
                  ),
                ],
              ),
              // 오른쪽
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: currentIndex == 2 ? AppColors.primary100 : AppColors.gray4,
                    ),
                    onPressed: () => _onTap(2),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: currentIndex == 3 ? AppColors.primary100 : AppColors.gray4,
                    ),
                    onPressed: () => _onTap(3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
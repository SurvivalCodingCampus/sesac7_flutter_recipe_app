import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/main_bottom_nav_item.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/custom_bottom_nav_bar_painter.dart';

class MainBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MainBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // 중앙 버튼의 크기
    final double centerButtonSize = 48.0;
    // 바의 높이 (중앙 버튼이 튀어나오는 부분 고려)
    final double barHeight = 72.0; // 기본 바 높이
    final double totalHeight =
        barHeight + centerButtonSize / 2; // 전체 높이 (튀어나온 부분 포함)

    return SizedBox(
      height: totalHeight, // 튀어나온 부분까지 포함한 높이
      child: Stack(
        alignment: Alignment.bottomCenter, // 스택 내 위젯들을 하단 중앙에 정렬
        children: [
          // 하얀색 배경 및 곡선 (CustomPaint)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(double.infinity, barHeight), // 바의 실제 높이
              painter: CustomBottomNavBarPainter(),
            ),
          ),

          // 중앙에 튀어나온 버튼
          Positioned(
            top: 0, // 바의 상단에 튀어나오게 위치
            child: FloatingActionButton(
              onPressed: () {
                // 중앙 버튼 클릭 액션
                print('중앙 버튼 클릭!');
              },
              elevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              backgroundColor: AppColors.primary100,
              shape: const CircleBorder(),
              // 원형 버튼
              child: const Icon(Icons.add, color: Colors.white, size: 21.0),
            ),
          ),

          // 내비게이션 아이템들 (아이콘들)
          Positioned(
            top: totalHeight / 2,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainBottomNavItem(
                  iconData: Icons.home,
                  index: 0,
                  label: '홈',
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                ),
                MainBottomNavItem(
                  iconData: Icons.bookmark_outline,
                  index: 1,
                  label: '저장',
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                ),
                SizedBox(width: centerButtonSize * 1.2),
                MainBottomNavItem(
                  iconData: Icons.notifications_none,
                  index: 2,
                  label: '알림',
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                ),
                MainBottomNavItem(
                  iconData: Icons.person_outline,
                  index: 3,
                  label: '내 정보',
                  selectedIndex: selectedIndex,
                  onItemTapped: onItemTapped,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

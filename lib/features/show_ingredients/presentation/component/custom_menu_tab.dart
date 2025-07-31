import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_ingredients/presentation/component/custom_menu_tab_item.dart';

import '../../../../ui/app_colors.dart';
import '../../data/menu_tab_list.dart';

class CustomMenuTab extends StatelessWidget {
  final void Function(int index) onSelectMenuItem;

  const CustomMenuTab({
    super.key,
    required this.onSelectMenuItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          // 전체 화면을 덮는 투명한 GestureDetector (메뉴 외부 클릭 시 닫기)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
          ),
          // 메뉴 위치 (우측 상단)
          Positioned(
            top: 50, // AppBar 높이 정도
            right: 30,
            child: Container(
              width: 164,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomMenuTabItem(
                    index: 0,
                    icon: Icons.share,
                    text: MenuTabList.Share.name,
                    isFirst: true,
                    onSelectMenuItem: (int index) {
                      onSelectMenuItem(index);
                    },
                  ),
                  CustomMenuTabItem(
                    index: 1,
                    icon: Icons.star,
                    text: MenuTabList.RateRecipe.name.replaceAll('te', 'te '),
                    onSelectMenuItem: (int index) {
                      onSelectMenuItem(index);
                    },
                  ),
                  CustomMenuTabItem(
                    index: 2,
                    icon: Icons.comment,
                    text: MenuTabList.Review.name,
                    onSelectMenuItem: (int index) {
                      onSelectMenuItem(index);
                    },
                  ),
                  CustomMenuTabItem(
                    index: 3,
                    icon: Icons.bookmark_rounded,
                    text: MenuTabList.Unsave.name,
                    isLast: true,
                    onSelectMenuItem: (int index) {
                      onSelectMenuItem(index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

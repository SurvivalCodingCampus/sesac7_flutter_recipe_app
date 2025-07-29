import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../../data/menu_tab_list.dart';

class CustomMenuTab extends StatelessWidget {
  final void Function() onButtonSelected;
  final void Function(int index) onSelectMenuItem;

  const CustomMenuTab({
    super.key,
    required this.onSelectMenuItem,
    required this.onButtonSelected,
  });

  void _showMenuDialog(BuildContext context) {
    onButtonSelected();
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
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
                      _buildMenuItem(
                        context,
                        0,
                        Icons.share,
                        MenuTabList.Share.name,
                        isFirst: true,
                      ),
                      _buildMenuItem(
                        context,
                        1,
                        Icons.star,
                        MenuTabList.RateRecipe.name.replaceAll('te', 'te '),
                      ),
                      _buildMenuItem(
                        context,
                        2,
                        Icons.comment,
                        MenuTabList.Review.name,
                      ),
                      _buildMenuItem(
                        context,
                        3,
                        Icons.bookmark_rounded,
                        MenuTabList.Unsave.name,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    int index,
    IconData icon,
    String text, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onSelectMenuItem(index);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            8,
            isFirst ? 20 : 10, // 첫 번째 아이템은 top padding 20
            8,
            isLast ? 20 : 10, // 마지막 아이템은 bottom padding 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 20),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyles.smallerTextRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMenuDialog(context),
      child: Icon(Icons.more_horiz, size: 24),
    );
  }
}

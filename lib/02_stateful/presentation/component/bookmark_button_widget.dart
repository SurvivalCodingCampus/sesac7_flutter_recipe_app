import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/app_colors.dart';

class BookmarkButtonWidget extends StatefulWidget {
  final bool isBookmarked;
  final VoidCallback onClick;

  const BookmarkButtonWidget({
    super.key,
    required this.isBookmarked,
    required this.onClick,
  });

  @override
  State<BookmarkButtonWidget> createState() => _BookmarkButtonWidgetState();
}

class _BookmarkButtonWidgetState extends State<BookmarkButtonWidget> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/images/bookmark_button_icon.png', // 북마크되지 않은 상태일 때의 이미지 경로
          width: 16, // 아이콘 크기 조절 (선택 사항)
          height: 16, // 아이콘 크기 조절 (선택 사항)
          color: isBookmarked
              ? AppColors.primary80
              : AppColors.gray4, // 아이콘 색상 (선택 사항)
        ),
      ),
    );
  }
}

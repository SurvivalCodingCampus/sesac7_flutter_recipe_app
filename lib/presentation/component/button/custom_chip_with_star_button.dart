import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class CustomChipWithStarButton extends StatelessWidget {
  final String contents;
  final void Function(bool isSelect) onTap; // 탭 이벤트 발생 시 호출될 콜백 (외부에서 상태 변경 처리)
  final TextStyle? textStyle;
  final bool isSelected;
  final bool isVisibleIcon;

  const CustomChipWithStarButton({
    super.key,
    required this.contents,
    required this.onTap,
    required this.isSelected,
    required this.isVisibleIcon,
    this.textStyle,
  });

  //bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(isSelected);
      }, // 외부에서 전달받은 onTap 콜백 호출
      child: Container(
        height: 27,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.white : AppColors.primary80,
            width: 1,
          ),
        ),
        // Text + Icon 영역
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              contents,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary80,
              ),
            ),
            if (isVisibleIcon) SizedBox(width: 4),
            if (isVisibleIcon) Icon(

                Icons.star_rounded,
                size: 18,
                color: isSelected ? AppColors.white : AppColors.primary80
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class CustomChipButton extends StatelessWidget {
  final String contents;
  final void Function(bool isSelect) onTap; // 탭 이벤트 발생 시 호출될 콜백 (외부에서 상태 변경 처리)
  final TextStyle? textStyle;
  final bool isSelected;

  const CustomChipButton({
    super.key,
    required this.contents,
    required this.onTap,
    required this.isSelected,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.white : AppColors.primary80,
            width: 1,
          ),
        ),
        child: Text(
          // <-- 콘텐츠 추가
          contents,
          style: TextStyles.smallerTextRegular.copyWith(
            color: isSelected ? AppColors.white : AppColors.primary80,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.text, required this.isSelected, required this.onSelectedCallback});

  final String text;
  final bool isSelected;
  final void Function(bool isSelected) onSelectedCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedCallback(!isSelected);
      },
      child: Container(
        alignment: Alignment.center,
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: 10), // 여백 추가
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(color: AppColors.primary100),
        ),
        child: Text(
          text,
          style: TextStyles.smallerTextRegular.copyWith(
            color: isSelected ? AppColors.white : AppColors.primary80,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

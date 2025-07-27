import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';

class FilterButton extends StatelessWidget {
  final void Function() onFilterButtonClick;

  const FilterButton({
    super.key,
    required this.onFilterButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterButtonClick,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          Icons.tune,
          size: 20,
          color: AppColors.white,
        ),
      ),
    );
  }
}

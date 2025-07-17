import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ThreeTabs extends StatelessWidget {
  static const double height = 58;
  static const double spacing = 7;
  static const double tabHeight = 33;
  static const int textMaxLines = 1;
  static const EdgeInsetsGeometry tabPadding = EdgeInsets.only(
    left: 20,
    right: 20,
    top: 12,
    bottom: 13,
  );
  static const EdgeInsetsGeometry tabButtonPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );

  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const ThreeTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: tabPadding,
        child: Row(
          spacing: spacing,
          children: [
            for (int i = 0; i < 3; i++)
              Expanded(
                child: SizedBox(
                  height: tabHeight,
                  child: GestureDetector(
                    onTap: () => onValueChange(i),
                    child: Container(
                      alignment: Alignment.center,
                      padding: tabButtonPadding,
                      decoration: BoxDecoration(
                        color: selectedIndex == i
                            ? AppColors.primary100
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          ComponentConstant.borderRadius,
                        ),
                      ),
                      child: Text(
                        labels[i],
                        style: TextStyles.smallerTextBold.copyWith(
                          color: selectedIndex == i
                              ? AppColors.white
                              : AppColors.primary80,
                        ),
                        maxLines: textMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

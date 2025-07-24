import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SearchInput extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool isFocused;
  final bool isDisabled;
  final bool isFilled;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  const SearchInput({
    super.key,
    required this.hint,
    this.controller,
    this.isFocused = false,
    this.isDisabled = false,
    this.isFilled = false,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color fillColor;
    Color iconColor;

    if (isDisabled) {
      borderColor = Colors.transparent;
      fillColor = AppColors.gray4;
      iconColor = AppColors.gray2;
    } else if (isFocused) {
      borderColor = AppColors.primary100;
      fillColor = AppColors.white;
      iconColor = AppColors.primary100;
    } else {
      borderColor = AppColors.gray4;
      fillColor = isFilled ? AppColors.white : Colors.transparent;
      iconColor = AppColors.gray2;
    }

    return GestureDetector(
      onTap: onTap,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: !isDisabled,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(Icons.search, color: iconColor),
            filled: true,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary100, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            color: isDisabled ? AppColors.gray2 : AppColors.black,
          ),
        ),
      ),
    );
  }
}

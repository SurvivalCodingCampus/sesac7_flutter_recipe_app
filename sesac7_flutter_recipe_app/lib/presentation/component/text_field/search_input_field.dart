import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  final String hint;
  final Function(String searchKeyword) onSearchKeywordChange;
  final VoidCallback? onSearchIconClick;

  const SearchInputField({
    super.key,
    required this.hint,
    required this.onSearchKeywordChange,
    this.onSearchIconClick
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40.0,
        child: TextField(
          onChanged: onSearchKeywordChange,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.searchInputFieldHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.gray4,
                width: 1.3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.primary80,
                width: 1.3,
              ),
            ),
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: GestureDetector(
              onTap: () {
                onSearchIconClick?.call();
              },
              child: Icon(
                Icons.search_outlined,
                color: AppColors.gray4,
                size: 18.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 11.5),
          ),
        ),
      ),
    );
  }
}

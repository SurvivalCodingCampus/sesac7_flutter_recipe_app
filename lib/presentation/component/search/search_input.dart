import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../screen/search_recipes/filter/search_input_state.dart';

class SearchInput extends StatelessWidget {

  final SearchInputModel model;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const SearchInput({super.key, required this.model, required this.controller, required this.focusNode, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      decoration: BoxDecoration(
        color: model.background,
        border: Border.all(
          color: model.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.gray4),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              enabled: model.inputState != SearchInputState.disabled,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              decoration: InputDecoration.collapsed(
                hintText: model.displayText,
                hintStyle: TextStyle(
                  color: model.inputState == SearchInputState.disabled
                      ? AppColors.gray4 : AppColors.gray2,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
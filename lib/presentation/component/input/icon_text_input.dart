import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class IconTextInput extends StatelessWidget {
  final String placeholderText;
  final void Function(String value) onChanged;
  final bool isDisabled;

  const IconTextInput({
    super.key,
    required this.placeholderText,
    required this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final hintTextColor = isDisabled ? AppColor.Gray2 : AppColor.Gray4;
    final filledColor = isDisabled ? AppColor.Gray4 : AppColor.White;

    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: onChanged,
          enabled: !isDisabled,
          style: TextStyle(fontSize: 11, height: 1.5),
          decoration: InputDecoration(
            filled: true,
            fillColor: filledColor,
            hintText: placeholderText,
            hintStyle: TextStyle(fontSize: 11, color: hintTextColor),
            contentPadding: EdgeInsets.only(left: 10),
            prefixIconConstraints: BoxConstraints(minWidth: 30, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 0),
              child: Icon(Icons.search_outlined, color: AppColor.Gray4, size: 20), // 아이콘 크기도 조절
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.Gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.Primary100),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.Gray4),
            ),
          ),
        ),
      ),
    );
  }
}
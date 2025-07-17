import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final String placeholderText;
  final void Function(String value) onChanged;
  final bool isDisabled;

  const TextInput({
    super.key,
    required this.labelText,
    required this.placeholderText,
    required this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final hintTextColor = isDisabled ? AppColor.Gray2 : AppColor.Gray4;
    final filledColor = isDisabled ? AppColor.Gray4 : AppColor.White;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelText', style: TextStyle(fontSize: 14, height: 1.5)),
        SizedBox(height: 5),
        TextField(
          onChanged: onChanged,
          enabled: !isDisabled,
          style: TextStyle(fontSize: 11, height: 1.5),
          decoration: InputDecoration(
            filled: true,
            fillColor: filledColor,
            contentPadding: EdgeInsets.all(20),
            hintText: '$placeholderText',
            hintStyle: TextStyle(fontSize: 11, color: hintTextColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.Gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.Primary100,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.Gray4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

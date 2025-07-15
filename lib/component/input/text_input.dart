import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class TextInput extends StatelessWidget {
  final String labelText;

  const TextInput({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Label', style: TextStyle(fontSize: 14, height: 1.5)),
        SizedBox(height: 5),
        TextField(

          style: TextStyle(fontSize: 11, height: 1.5),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            hintText: 'Placeholder',
            hintStyle: TextStyle(fontSize: 11, color: AppColor.Gray4),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.Gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.Primary100,
              ), // 포커스 시 AppColor.Primary100 색상
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class DefaultInputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final void Function(String value) onValueChange;

  const DefaultInputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.smallTextRegular,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: AppColors.gray4),
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color: AppColors.gray4),
                borderRadius: BorderRadius.circular(10),
              ),
              // border: OutlineInputBorder(
              //   borderSide:BorderSide(color: AppColors.gray4),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primary80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  // final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: DefaultInputField(label: 'test', placeHolder: 'Search recipe', onValueChange: (String value) {  },),
          ),
        ),
      ),
    ),
  );
}
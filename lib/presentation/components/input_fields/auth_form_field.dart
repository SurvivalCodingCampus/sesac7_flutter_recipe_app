import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class AuthFormField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final void Function(String value) onValueChange;

  const AuthFormField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 21,
        //   child: Text(
        //     label,
        //     style: TextStyles.smallerTextRegular,
        //   ),
        // ),
        Text(
          label,
          style: TextStyles.smallTextRegular,
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: onValueChange,
          decoration: InputDecoration(
            hintText: placeHolder,
            hintStyle: TextStyles.smallerTextRegular.copyWith(
              color: AppColors.gray4),
            contentPadding: EdgeInsets.only(
              left: 20,
              top: 19,
              bottom: 19,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide(color: AppColors.gray4, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            // border: OutlineInputBorder(
            //   borderSide:BorderSide(color: AppColors.gray4),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary80, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

// void main() {
//   // final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Center(
//             child: AuthFormField(label: 'test', placeHolder: 'Search recipe', onValueChange: (String value) {  },),
//           ),
//         ),
//       ),
//     ),
//   );
// }
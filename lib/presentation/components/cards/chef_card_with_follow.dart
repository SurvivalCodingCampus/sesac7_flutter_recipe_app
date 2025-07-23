import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ChefCardWithFollow extends StatelessWidget {
  const ChefCardWithFollow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/chef_image.png'),
              ),
              Column(
                children: [
                  Text(
                    'chef',
                    style: TextStyles.smallTextBold,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.map,
                        size: 17,
                      ),
                      Text(
                        'city',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.gray3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(85, 37),
              backgroundColor: AppColors.primary100,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text('Follow'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: ChefCardWithFollow(),
        ),
      ),
    ),
  );
}

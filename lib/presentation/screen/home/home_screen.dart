import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 15),
            child: Column(
              spacing: 30,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Jega',
                          style: TextStyles.largeTextBold,
                        ),
                        Text(
                          'What are you cooking today?',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.secondary40,
                        borderRadius: BorderRadius.circular(
                          ComponentConstant.borderRadius,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/avator/avator-sample.png',
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: SearchField(
                        placeholder: 'Search recipe',
                        onValueChange: (value) {},
                      ),
                    ),
                    SearchFilterButton(
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_icon_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/icon_text_input.dart';
import 'package:flutter_recipe_app/presentation/component/widget/filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class HomeRecipeScreen extends StatelessWidget {
  const HomeRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Jega',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'what are you cooking today?',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColor.Gray3,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SmallIconButton(
                    icon: Icons.perm_identity_rounded,
                    onTap: () {},
                    color: AppColor.Secondary40,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  IconTextInput(
                    placeholderText: 'Search',
                    onChanged: (String text) {},
                  ),
                  SizedBox(width: 20),
                  SmallIconButton(icon: Icons.tune, onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

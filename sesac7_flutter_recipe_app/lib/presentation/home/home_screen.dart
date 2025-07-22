import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Jega',
                            style: TextStyles.homeScreenTitle,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'What are you cooking today?',
                            style: TextStyles.homeScreenSubTitle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.secondary40,
                        ),
                        child: Image.asset('assets/profile_image.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      SearchInputField(
                        hint: 'Search recipe',
                        onSearchKeywordChange: (searchKeyword) {},
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      SearchRecipeFilterButton(
                        onClick: () {
                          showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: AppColors.white,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                              ),
                            ),
                            builder: (context) {
                              return SearchRecipeFilterBottomSheet(
                                onValueChange:
                                    (timeType, ratingType, categoryType) {},
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../ui/text_styles.dart';
import '../component/input_field/search_inpu_field.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Jega',
                        style: TextStyles.largeTextBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        'What are you cooking today?',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    // 테두리 라운드
                    decoration: BoxDecoration(
                      color: AppColors.secondary40,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      // 또는 Image.network(...)
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SearchInpuField(
                    placeHolder: 'Search recipes',
                    value: '',
                    onValueChange: (String value) {
                      //searchRecipeViewModel.searchRecipes(value);
                    },
                  ),
                  SizedBox(width: 20), // 입력 필드와 필터 사이의 간격)
                  GestureDetector(
                    onTap: () async {
                      // 필터 클릭 시 동작
                      // final result = await _showFilterBottomSheet(context, filterViewModel);
                      // searchRecipeViewModel.updateSearchFilterOptions(result);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        // 아이콘을 중앙에 배치하기 위해 Center 위젯 사용
                        child: Image.asset(
                          'assets/icons/recipe_filter_setting.png',
                          height: 20, // 이미지 크기 조절
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

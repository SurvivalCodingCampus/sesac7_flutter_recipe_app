import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_home_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../di/di_setup.dart';
import '../../domain/model/recipe.dart';
import '../../ui/text_styles.dart';
import '../component/card/dish_card.dart';
import '../component/control/recipe_category_selector.dart';
import '../component/input_field/search_inpu_field.dart';
import '../state_holder/recipe_home_state_holder.dart';
import 'action/main_screen_action.dart';

class MainScreen extends StatelessWidget {
  final RecipeHomeStateHolder state;
  final void Function(MainScreenAction action) onAction;

  const MainScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

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
              SizedBox(
                height: 15,
              ),
              // 카테고리 선택기 (StatelessWidget)
              if (state.categories.isNotEmpty)
                RecipeCategorySelector(
                  categories: state.categories,
                  selectedCategory: state.selectedCategory,
                  onSelectCategory: (category) {
                    //selectCategory(category); // ViewModel의 메서드 호출
                    //SelectCategory(category);
                    onAction(SelectCategory(category));
                  },
                ),

              // 선택된 카테고리에 따른 요리 카드 목록
              SizedBox(
                height: 240,
                child:
                    state.filteredRecipes.isEmpty &&
                        !state.isLoading
                    ? const Center(child: Text('해당 카테고리의 레시피가 없습니다.'))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount:
                            state.filteredRecipes.length,
                        itemBuilder: (context, index) {
                          final recipe =
                              state.filteredRecipes[index];
                          return DishCard(
                            recipe: recipe,
                            onTapFavorite: (tappedRecipe) {
                              //homeRecipeViewModel.toggleFavorite(tappedRecipe); // ViewModel의 메서드 호출
                              onAction(ToggleFavorite(tappedRecipe));
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

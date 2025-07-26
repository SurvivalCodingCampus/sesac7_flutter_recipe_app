import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/input_field/search_inpu_field.dart';
import 'package:flutter_recipe_app/presentation/screen/action/search_recipes_action.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/card/small_recipe_card.dart';
import '../state_holder/search_recipes_state.dart';

class SearchRecipeScreen extends StatelessWidget {
  const SearchRecipeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          icon: const Icon(Icons.arrow_back, color: AppColors.colour),
          // 아이콘 색상도 지정 가능
          onPressed: () {
            // 현재 화면을 스택에서 제거하고 이전 화면으로 돌아감
            //onClose();
            onAction(SearchRecipesAction.onClose());
            // if (Navigator.canPop(context)) {
            //   Navigator.pop(context);
            // } else {
            //   // 더 이상 뒤로 갈 화면이 없을 때의 처리 (예: 앱 종료 또는 특정 화면으로 이동)
            //   // SystemNavigator.pop(); // 앱 종료 (주의해서 사용)
            //   print("Can't pop further!");
            // }
          },
        ),
        title: Text(
          'Search recipes',
          style: TextStyles.mediumTextBold.copyWith(color: AppColors.colour),
        ),
        centerTitle: true,
        // 타이틀 중앙 정렬
        backgroundColor: Colors.white,
        // 배경색 흰색
        elevation: 0, // AppBar 아래 그림자 제거
      ),
      body: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                SearchInpuField(
                  placeHolder: 'Search recipes',
                  value: '',
                  onValueChange: (String value) {
                    //searchRecipeViewModel.searchRecipes(value);
                    //onTextValueChange(value);
                    onAction(SearchRecipesAction.onTextValueChange(value));
                  },
                ),
                SizedBox(width: 20), // 입력 필드와 필터 사이의 간격)
                GestureDetector(
                  onTap: () async {
                    // 필터 클릭 시 동작
                    //onCallFilterBottomSheet();
                    onAction(SearchRecipesAction.onCallFilterBottomSheet());
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                              state
                              .keyword
                              .isEmpty
                          ? 'Recent Search'
                          : 'Search Search',
                      style: TextStyles.normalTextBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${state.recipes.length} result',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ),

            if (state.isLoading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 100),
                  itemCount: state
                      .recipes
                      .length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1 / 1, // 아이템 비율 조절
                      ),
                  itemBuilder: (context, index) {
                    final searchTerm = state
                        .recipes[index];
                    return GestureDetector(
                      onTap: () {
                        // searchRecipeViewModel.fetchRecipes(searchTerm);

                        print('Recent search tapped: $searchTerm');
                      },
                      child: SmallRecipeCard(
                        recipe: searchTerm,
                        saveRecipeCallback: (recipeId) {},
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
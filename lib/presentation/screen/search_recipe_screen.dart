import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/input_field/search_inpu_field.dart';

import '../../data/state_holder/filter_search_state.dart';
import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/card/small_recipe_card.dart';
import '../view_model/filter_view_model.dart';
import '../view_model/search_recipe_view_model.dart';
import 'filter_search_bottom_sheet.dart';

class SearchRecipeScreen extends StatelessWidget {
  const SearchRecipeScreen({super.key, required this.searchRecipeViewModel, required this.filterViewModel});

  final SearchRecipeViewModel searchRecipeViewModel;
  final FilterViewModel filterViewModel;

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
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // 더 이상 뒤로 갈 화면이 없을 때의 처리 (예: 앱 종료 또는 특정 화면으로 이동)
              // SystemNavigator.pop(); // 앱 종료 (주의해서 사용)
              print("Can't pop further!");
            }
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
      body: ListenableBuilder(
        listenable: searchRecipeViewModel,
        builder: (BuildContext context, Widget? child) {
          return Container(
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
                        searchRecipeViewModel.searchRecipes(value);
                      },
                    ),
                    SizedBox(width: 20), // 입력 필드와 필터 사이의 간격)
                    GestureDetector(
                      onTap: () async {
                        // 필터 클릭 시 동작
                        final result = await _showFilterBottomSheet(context, filterViewModel);
                        searchRecipeViewModel.updateSearchFilterOptions(result);
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
                          searchRecipeViewModel.searchRecipesState.keyword.isEmpty ? 'Recent Search' : 'Search Search',
                          style: TextStyles.normalTextBold.copyWith(color: AppColors.black),
                        ),
                      ),
                      Spacer(),
                      Text('${searchRecipeViewModel.searchRecipesState.recipes.length} result',
                        style: TextStyles.smallerTextRegular.copyWith(color: AppColors.gray3),),
                    ],
                  ),
                ),

                if(searchRecipeViewModel.searchRecipesState.isLoading)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      itemCount: searchRecipeViewModel.searchRecipesState.recipes.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1 / 1, // 아이템 비율 조절
                      ),
                      itemBuilder: (context, index) {
                        final searchTerm = searchRecipeViewModel.searchRecipesState.recipes[index];
                        return GestureDetector(
                          onTap: () {
                            // searchRecipeViewModel.fetchRecipes(searchTerm);
                            print('Recent search tapped: $searchTerm');
                          },
                          child: SmallRecipeCard(recipe: searchTerm, saveRecipeCallback: (recipeId){}),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// 필터 화면을 바텀 시트로 띄우는 함수
Future<FilterSearchState> _showFilterBottomSheet(BuildContext context, FilterViewModel filterViewModel) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 바텀 시트가 화면 전체 높이까지 확장될 수 있도록 설정
    backgroundColor: Colors.transparent, // 배경을 투명하게 하여 모서리 둥글게 처리가 잘 보이도록 함
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          // 초기 바텀 시트 높이 (화면 높이의 70%)
          minChildSize: 0.5,
          // 최소 높이
          maxChildSize: 0.9,
          // 최대 높이
          expand: false,
          // 화면 전체로 확장될지 여부 (여기서는 false로 DraggableScrollableSheet 사용)
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white, // 바텀 시트의 실제 배경색
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ), // 상단 모서리 둥글게
              ),
              child: ClipRRect(
                // 둥근 모서리 내부 콘텐츠도 잘리도록 ClipRRect 사용
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
                child: FilterSearchBottomSheet(
                  scrollController: scrollController,
                  filterViewModel: filterViewModel,
                  onFilterSelected: (FilterSearchState filterSearchState) {
                    // 필터 선택 시 호출되는 콜백
                    Navigator.pop(context, filterSearchState);
                  },
                ), // 필터 화면 전달
              ),
            );
          },
        ),
      );
    },
  );
}

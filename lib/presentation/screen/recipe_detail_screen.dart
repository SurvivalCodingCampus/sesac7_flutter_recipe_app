import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_item.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_detail_view_model.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/card/recipe_ex_card.dart';
import '../component/tab/tabs.dart';

class RecipeDetailScreen extends StatefulWidget {
  final RecipeDetailViewModel _recipeDetailViewModel;
  final String _recipeId;

  const RecipeDetailScreen({
    super.key,
    required String recipeId,
    required RecipeDetailViewModel recipeDetailViewModel,
  }) : _recipeDetailViewModel = recipeDetailViewModel, _recipeId = recipeId;

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  @override
  void initState() {
    super.initState();

    widget._recipeDetailViewModel.fetchRecipeDetail(widget._recipeId);
  }
  // 탭 상태 관리를 위한 변수 (예시, 실제로는 ViewModel 등에서 관리 권장)
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back, color: AppColors.colour),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("Can't pop further!");
            }
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: AppColors.black),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget._recipeDetailViewModel,
        builder: (BuildContext context, Widget? child) {
          // child 변수명 수정 (이전 답변 반영)

          // 레시피 데이터가 null이거나 비어있는 경우에 대한 처리 (방어 코드)
          // if (widget._recipe == null) { // Recipe는 nullable이 아님
          //   return Center(child: Text("Recipe data is not available."));
          // }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            color: AppColors.white,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch, // 필요하다면
                      children: [
                        widget._recipeDetailViewModel.recipe != null ? RecipeExCard(
                          recipe: widget._recipeDetailViewModel.recipe!,
                          saveRecipeCallback: (recipeId) {},
                        ) : Container(),
                        const SizedBox(height: 8), // 기존 간격 유지
                        Tabs(
                          // labels: ['test1', 'test2'], // 실제 탭 이름으로 변경
                          labels: const ['Ingredients', 'Steps'],
                          selectedIndex: _selectedTabIndex,
                          onValueChanged: (index) {
                            setState(() {
                              // 탭 상태 변경 시 UI 업데이트
                              _selectedTabIndex = index;
                            });
                            // ViewModel에도 알리거나 다른 로직 처리
                          },
                        ),
                      ],
                    ),
                  ),
                ];
              },
              // body는 스크롤 가능한 메인 콘텐츠 영역입니다.
              // 선택된 탭에 따라 다른 리스트를 보여줍니다.
              body: _buildSelectedTabContent(),
            ),
          );
        },
      ),
    );
  }

  // [1] _RecipeDetailScreenState -> _buildSelectedTabContent()

  Widget _buildSelectedTabContent() {
    Widget content;
    String itemCountText = ''; // 아이템 또는 스텝 개수를 표시할 텍스트

    if (_selectedTabIndex == 0) {
      // Ingredients 탭
      final ingredientsCount =
          widget._recipeDetailViewModel.recipe?.ingredients.length ?? 0;
      itemCountText =
          '$ingredientsCount item${ingredientsCount == 1 ? '' : 's'}'; // 단수/복수 처리

      if (ingredientsCount == 0) {
        content = const Center(child: Text("No ingredients available."));
      } else {
        content = ListView.separated(
          // shrinkWrap: true, // Column 내부에 ListView를 직접 넣을 때 필요할 수 있으나,
          // NestedScrollView의 body에서는 일반적으로 필요 없음.
          // physics: NeverScrollableScrollPhysics(), // NestedScrollView와 함께라면 이것도 보통 필요 없음.
          padding: EdgeInsets.zero,
          // Column 내부에서 패딩은 Column에 적용하거나 아래 Row/ListView에 개별 적용
          itemCount: ingredientsCount,
          itemBuilder: (context, index) {
            final ingredient =
                widget._recipeDetailViewModel.recipe?.ingredients[index];
            return ingredient != null ? IngredientItem(ingredient: ingredient) : Container();
          },
          separatorBuilder: (context, index) {
            // 아이템 사이에 들어갈 위젯
            return SizedBox(height: 10.0); // 12px 높이의 빈 공간으로 간격 주기
            // 또는 return Divider(height: 1, color: Colors.grey); // 구분선 추가
          },
        );
      }
    } else if (_selectedTabIndex == 1) {
      // Steps 탭
      final stepsCount = widget._recipeDetailViewModel.recipe?.steps.length;
      itemCountText =
          '$stepsCount step${stepsCount == 1 ? '' : 's'}'; // 단수/복수 처리

      if (stepsCount == 0) {
        content = const Center(child: Text("No steps available."));
      } else {
        content = Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              // 아이템 사이에 들어갈 위젯
              return SizedBox(height: 10.0); // 12px 높이의 빈 공간으로 간격 주기
              // 또는 return Divider(height: 1, color: Colors.grey); // 구분선 추가
            },
            padding: EdgeInsets.zero,
            itemCount: stepsCount ?? 0,
            itemBuilder: (context, index) {
              final step = widget._recipeDetailViewModel.recipe?.steps[index];
              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.gray4,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Step ${step?.stepNumber}', style: TextStyles.smallerTextBold.copyWith(color: AppColors.colour)),
                    SizedBox(height: 5),
                    Text(step?.description ?? '', style: TextStyles.smallerTextRegular.copyWith(color: AppColors.gray3))
                  ],
                ),
              );
                /*ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.secondary100, // 예시 색상
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: AppColors.primary100,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(step?.description ?? 'No description for this step.'),
              );*/
            },
          ),
        );
      }
    } else {
      content = const Center(child: Text("Unknown tab selected."));
    }

    // itemCountText가 비어있지 않은 경우에만 정보 Row를 표시 (예: Unknown tab의 경우 표시 안 함)
    // 또는 로딩 중이거나 데이터가 아예 없을 때도 이 부분을 건너뛸 수 있도록 조건 추가 가능
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // Column 내의 Text를 왼쪽 정렬하기 위함
      children: [
        SizedBox(height: 20,),
        if (itemCountText.isNotEmpty) // itemCountText가 있을 때만 이 Row를 그림
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 필요에 따라
            children: [
              // 아이콘은 선택 사항. 여기서는 이전 bell 아이콘을 사용하지 않고 텍스트만 표시.
              // 만약 아이콘을 계속 사용하고 싶다면 이전 Image.asset 로직을 여기에 추가.
              // 예시: item/step 아이콘을 추가한다면
              // Icon(_selectedTabIndex == 0 ? Icons.list_alt : Icons.format_list_numbered, color: AppColors.gray3, size: 17),
              // const SizedBox(width: 5),
              Row(
                children: [
                  //Icon(_selectedTabIndex == 0 ? Icons.list_alt : Icons.format_list_numbered, color: AppColors.gray3, size: 17),
                  Image.asset(
                    'assets/icons/bell.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '1 serve',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.gray3,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              Text(
                itemCountText,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.gray3,
                  fontSize: 11,
                ),
              ),
              // 만약 "1 serve" 같은 정보를 계속 유지하고 싶다면,
              // 이 Row 내부에 추가하거나, 별도의 Text 위젯으로 분리.
              // 여기서는 일단 아이템/스텝 개수만 표시하는 것으로 단순화.
              // const Spacer(), // 오른쪽으로 붙일 다른 텍스트가 있다면 사용
            ],
          ),
        const SizedBox(height: 20),
        Expanded(
          // ListView가 Column 내에서 남은 공간을 모두 차지하도록 함
          child: content, // 실제 ListView 또는 "No items" 메시지
        ),
      ],
    );
  }
}

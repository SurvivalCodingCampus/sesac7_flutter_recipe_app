import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/routing/router.dart';
import '../../ui/app_colors.dart';
import '../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../core/presentation/component/recipe_card.dart';
import '../../core/presentation/component/search/search_input.dart';

// void main() {
//   final searchRecipesViewModel = SearchRecipesViewModel();
//
//   runApp(
//     MaterialApp(
//       home: ListenableBuilder(
//         listenable: searchRecipesViewModel,
//         builder: (context, child) {
//           return SearchRecipeScreen(
//             viewModel: searchRecipesViewModel,
//           );
//         },
//       ),
//     ),
//   );
// }

class SearchRecipeScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipeScreen({super.key, required this.viewModel});

  // viewModel 안에서 실제로 모델을 받아서 repository impl를 활용해 생성자를 활용해 구현체를 만들면
  // 교체할 타이밍이 없어서 테스트가 어려워진다.

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                      onPressed: null,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Center(
                        child: const Text(
                          'Search recipes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SearchInput(
                        hint: 'Search recipes',
                        onChanged: viewModel.search,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        showModalBottomSheet<FilterSearchBottomSheet>(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return FilterSearchBottomSheet(
                              initialFilter: viewModel.state.filterSearchState,
                              onFilterApplied: (appliedFilter) {
                                print('[DEBUG] 필터 적용: $appliedFilter');
                                viewModel.filter(appliedFilter);
                                Navigator.pop(context);
                              },
                            );
                          }
                        );
                      },
                      child: Material(
                        color: Colors.transparent, // 리플
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          // onTap: viewModel.onPressed,
                          borderRadius: BorderRadius.circular(12),
                          splashColor: AppColors.primary100.withAlpha(100),
                          highlightColor: Colors.transparent,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.primary100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'lib/asset/ic_setting.svg',
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Recent Search',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: viewModel.state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2열
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                          itemCount: viewModel.state.filteredRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = viewModel.state.filteredRecipes[index];
                            return RecipeCard(
                              recipe: recipe,
                              isShowTime: false,
                              isBookmarked: false,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

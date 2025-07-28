import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_state.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/routing/router.dart';
import '../../ui/app_colors.dart';
import '../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../core/presentation/component/recipe_card.dart';
import '../../core/presentation/component/search/search_input.dart';

class SearchRecipeScreen extends StatelessWidget {
  // final SearchRecipesViewModel viewModel;
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;
  // final void Function(String query) onChanged;
  // final void Function() showFilterBottomSheet;

  const SearchRecipeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  // viewModel 안에서 실제로 모델을 받아서 repository impl를 활용해 생성자를 활용해 구현체를 만들면
  // 교체할 타이밍이 없어서 테스트가 어려워진다.

  @override
  Widget build(BuildContext context) {
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
                    onChanged: (value) {
                      onAction(SearchRecipesAction.search(value));
                    }
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    onAction(SearchRecipesAction.showFilterBottomSheet());
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
                            'asset/ic_setting.svg',
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
              child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2열
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                  itemCount: state.filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.filteredRecipes[index];
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
}

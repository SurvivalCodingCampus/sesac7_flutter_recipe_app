import 'package:flutter/material.dart';
import '../../../domain/model/recipe.dart';
import '../../../ui/app_colors.dart';
import 'recipe_detail_state.dart';
import 'recipe_detail_view_model.dart';
import 'component/recipe_detail_header.dart';
import 'component/recipe_detail_card.dart';
import 'component/chef_profile.dart';
import 'component/recipe_tabs.dart';
import 'component/ingredient_list.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return RecipeDetailView(recipe: recipe);
  }
}

class RecipeDetailView extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailView({
    super.key,
    required this.recipe,
  });

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  late RecipeDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RecipeDetailViewModel(recipe: widget.recipe);
    _viewModel.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            RecipeDetailHeader(
              onBackPressed: () => Navigator.of(context).pop(),
              onMorePressed: _viewModel.onMorePressed,
            ),

            // 스크롤 가능한 컨텐츠
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 레시피 카드
                    RecipeDetailCard(
                      recipe: _viewModel.recipe,
                      onBookmarkPressed: _viewModel.onBookmarkPressed,
                      isBookmarked: _viewModel.state.isBookmarked,
                    ),

                    const SizedBox(height: 20),

                    // 셰프 프로필
                    ChefProfile(
                      chefName: _viewModel.recipe.chef,
                      location: 'Lagos, Nigeria', // 실제로는 Recipe 모델에 추가 필요
                      onFollowPressed: _viewModel.onFollowPressed,
                      isFollowing: _viewModel.state.isFollowing,
                    ),

                    const SizedBox(height: 20),

                    // 탭
                    RecipeTabs(
                      selectedTab: _viewModel.state.selectedTab,
                      onTabChanged: _viewModel.onTabChanged,
                    ),

                    const SizedBox(height: 20),

                    // 탭 컨텐츠
                    if (_viewModel.state.selectedTab == RecipeTab.ingredient)
                      const IngredientList()
                    else
                      const ProcedureList(), // TODO: 구현 필요
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 임시 ProcedureList 컴포넌트
class ProcedureList extends StatelessWidget {
  const ProcedureList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: const Center(
        child: Text(
          'Procedure List - Coming Soon',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

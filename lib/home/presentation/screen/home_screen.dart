import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/nav_bar/bottom_nav_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/presentation/component/category_tab.dart';
import '../../../ui/app_colors.dart';
import '../../../core/presentation/component/search/search_input.dart';
import '../../domain/model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {

        final state = viewModel.state;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                 Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hello Jega',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'What are you cooking today?',
                                style: TextStyle(fontSize: 14, color: AppColors.gray3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD580),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Image.asset(
                              'asset/profile_image.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        const Expanded(
                          child: SearchInput(
                            hint: 'Search recipes',
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          // onTap: viewModel.onPressed,
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
                  ],
                ),
              ),
              const SizedBox(height: 30),

              CategoryTab(
                categories: viewModel.state.categories,
                selected: viewModel.state.selectedCategory,
                onTap: viewModel.selectCategory,
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 220,
                child: viewModel.state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // children: [
                  //   for (var recipe in viewModel.filteredRecipes)
                  //     RecipeCard(
                  //       recipe: recipe,
                  //       onBookmark: () => viewModel.toggleBookmark(recipe.id),
                  //     ),
                  // ],
                ),
              ),
              const Spacer(),

              // BottomNavBar(
              //   body: null,
              //   selectedIndex: 0,
              //   onTap: (index) => viewModel.setIndex(index),
              // ),
            ],
          ),
        );
      }
    );
  }
}
